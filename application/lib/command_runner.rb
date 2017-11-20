require 'digest'

class HecksApplication
  # Run an application command, with validations and broacast lifecycle events
  class CommandRunner
    attr_reader :module_name, :command

    def initialize(command_name:, module_name:, args:, application:, async: false)
      @command_name = command_name
      @module_name  = module_name
      @args         = args
      @application  = application
      @domain_spec  = application.domain_spec
      @async        = async
    end

    def call()
      fetch_command
      run_command
      broadcast
      command
    end

    private

    attr_reader :command_name, :args, :application, :domain_spec, :async

    def broadcast
      application.events_port.send(command: command, module_name: module_name)
    end

    def fetch_command
      args.merge!(id: SecureRandom.uuid) if command_name == :create
      @command = Commands.const_get(command_name.to_s.camelcase).new(
        repository:    application.database[module_name],
        args:          args,
        domain_module: fetch_module
      )
    end

    def fetch_module
      domain_spec.domain_modules[module_name.to_s.camelize.to_sym]
    end

    def run_command
      if async
        Thread::new { command.call }
      else
        command.call
      end

      command
    end
  end
end

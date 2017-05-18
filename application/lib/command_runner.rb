class HecksApplication
  # Run an application command, with validations and broacast lifecycle events
  class CommandRunner
    attr_reader :module_name, :command

    def initialize(command_name:, module_name:, args:, application:)
      @command_name = command_name
      @module_name  = module_name
      @args         = args
      @application  = application
      @domain_spec  = application.domain_spec
    end

    def run()
      generate_id
      fetch_command
      enqueue_command
      # call_command
      broadcast
      self
    end

    def result
      { id: id, args: args }
    end

    private

    attr_reader :command_name, :args, :application, :domain_spec, :id

    def generate_id
      @id = SecureRandom.uuid
    end

    def broadcast
      application.events_port.send(command: command, module_name: module_name)
    end

    def enqueue_command
      CommandBus.enqueue(command, id)
    end

    def call_command
      command.call
    end

    def fetch_command
      @command = Commands.const_get(command_name.to_s.camelcase).new(
        repository: application.database[module_name],
        args:       args,
        domain_module: fetch_module,
        id: id
      )
    end

    def fetch_module
      domain_spec.domain_modules[module_name.to_s.camelize.to_sym]
    end
  end
end

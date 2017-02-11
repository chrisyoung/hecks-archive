module Hecks
  module Adapters
    class Application
      class Runner
        attr_reader :module_name, :command

        def initialize(command_name:, module_name:, args:, application:)
          @command_name = command_name
          @module_name = module_name
          @args = args
          @application = application
        end

        def call()
          fetch_command
          run_command

          @application.events_port.send(
            command: command,
            module_name: module_name
          )
          command
        end

        def database
          @application.database
        end

        def domain_spec
          @application.domain_spec
        end

        private

        attr_reader :command_name, :args

        def fetch_command
          @command = Commands.const_get(command_name.to_s.camelcase).new(
            repository: database[module_name],
            args:       args,
            domain_module: domain_spec.domain_modules[module_name.to_s.camelize.to_sym]
          )
        end

        def run_command
          @command = command.call
        end
      end
    end
  end
end

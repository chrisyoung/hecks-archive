require_relative 'validations'

module Hecks
  module Ports
    module Left
      class App
        def initialize(database: nil, listeners: [], domain:)
          @domain           = domain
          @database         = database || Adapters::Right::Database::Memory.new(domain: domain)
          @validations      = Ports::App::Validations
          @events_port      = Ports::Right::Events.new(listeners: listeners)
          @domain = domain
        end

        def call(command_name:, module_name:, args: {})
          @module_name  = module_name.to_sym
          @command_name = command_name.to_sym
          @args         = args

          fetch_command
          validate
          run_command
          broadcast
          command
        end

        def query(query:, module_name:, args: {})
          @module_name = module_name
          @query       = [module_name, query]

          Domain.queries[@query].new(
            repository: database[module_name]
          ).call(args)
        end

        private

        attr_reader :command_name, :command, :module_name, :database, :args, :events_port, :validations, :domain, :validation_command

        def validate
          @validation_command = validations.new(
            command: command,
            module_name: module_name,
            domain: domain).call
        end

        def fetch_command
          @command = Commands.const_get(command_name.to_s.camelcase).new(
            repository: database[module_name],
            args: args
          )
        end

        def run_command
          @command.errors = validation_command.errors
          @command = command.call unless @command.errors.count > 0
        end

        def broadcast
          events_port.send(command: command, module_name: module_name)
        end
      end
    end
  end
end

# Convenience class for calling use cases.  The #[] method will look up any
# usecase and run it by passing args and a repositories container.
#
# Pizzas.new[:some_use_case, arg1: arg1, arg2: arg:2]
#
# You can pass in repositories using the initializer if you want to use
# something other than the default domain repos
module PizzaServerHexagon
  class App
    def initialize(database:  Adapters::Databases::Memory.new, listeners: [])
      @database         = database
      @validations      = Ports::App::Validations
      @events_port      = Ports::Events.new(listeners: listeners)
    end

    def call(command:, module_name:, args: {})
      @module_name  = module_name.to_sym
      @command      = [module_name, command]
      @args         = args

      fetch_command
      validate
      run_command
      broadcast
      result
    end

    def query(query:, module_name:, args: {})
      @module_name = module_name
      @query       = [module_name, query]

      Domain.queries[@query].new(
        repository: database[module_name]
      ).call(args)
    end

    private

    attr_reader :command, :module_name, :result, :database, :args, :events_port, :validations

    def validate
      @result = validations.new(@fetched_command)
    end

    def fetch_command
      @fetched_command = Domain.commands[command].new(args: args)
    end

    def run_command
      @result = Domain.commands[command].new(result).call
    end

    def broadcast
      events_port.send(result)
    end
  end
end

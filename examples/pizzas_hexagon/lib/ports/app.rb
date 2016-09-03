# Convenience class for calling use cases.  The #[] method will look up any
# usecase and run it by passing args and a repositories container.
#
# Pizzas.new[:some_use_case, arg1: arg1, arg2: arg:2]
#
# You can pass in repositories using the initializer if you want to use
# something other than the default domain repos
module PizzasHexagon
  class App
    def initialize(database:  Adapters::Databases::Memory.new, listeners: [])
      @database         = database
      @events_port      = Ports::Events.new(listeners: listeners)
      @validations_port = Ports::Validations
    end

    def call(command:, module_name:, args: {})
      @module_name  = module_name.to_sym
      @command      = [module_name, command]
      @args         = args

      validate
      create
      broadcast
    end

    private

    attr_reader :command, :module_name, :result, :database, :args, :events_port, :validations_port

    def validate
      @result = validations_port.new(args: args).call
    end

    def create
      @result = Domain.use_cases[command].new(result)
    end

    def broadcast
      events_port.send(result)
    end
  end
end

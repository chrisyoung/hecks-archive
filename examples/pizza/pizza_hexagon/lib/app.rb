# Convenience class for calling use cases.  The #[] method will look up any
# usecase and run it by passing args and a repositories container.
#
# PizzaHexagon.new[:some_use_case, arg1: arg1, arg2: arg:2]
#
# You can pass in repositories using the initializer if you want to use
# something other than the default domain repos
module PizzaHexagon
  class App
    def initialize(database: Databases::Memory.new, listeners: [])
      @database      = database
      @events_port   = Ports::Events.new(listeners: listeners)
    end

    def delete_all
      @database.delete_all
    end

    def run(module_name, command_name, args={})
      Domain.use_cases[[module_name, command_name]].new(
        args:        args,
        database:    @database,
        events_port: @events_port
      ).call
    end

    def query(module_name, args={})
      @database[module_name].query args
    end
  end
end

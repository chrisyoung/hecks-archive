# Convenience class for calling use cases.  The #[] method will look up any
# usecase and run it by passing args and a repositories container.
#
# Pizzas.new[:some_use_case, arg1: arg1, arg2: arg:2]
#
# You can pass in repositories using the initializer if you want to use
# something other than the default domain repos
module Pizzas
  class App
    def initialize(database: Databases::Memory.new, listeners: [])
      @database      = database
      @events_port   = Ports::Events.new(listeners: listeners)
    end

    def delete_all
      @database.delete_all
    end

    def run(module_name, command_name, args={})
      command_name = [module_name, command_name]

      command = Domain.use_cases[command_name].new(
        args:        args,
        repository:  @database[module_name]
      ).call

      @events_port.send(
        event:   command_name.join('_').to_sym,
        command: command
      )
    end

    def query(module_name, args={})
      @database[module_name].query args
    end
  end
end

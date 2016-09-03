# Convenience class for calling use cases.  The #[] method will look up any
# usecase and run it by passing args and a repositories container.
#
# Pizzas.new[:some_use_case, arg1: arg1, arg2: arg:2]
#
# You can pass in repositories using the initializer if you want to use
# something other than the default domain repos
module PizzasHexagon
  class App
    def initialize(
      command:,
      module_name:,
      args:      {},
      database:  Adapters::Databases::Memory.new,
      listeners: []
    )
      @database     = database
      @events_port  = Ports::Events.new(listeners: listeners)
      @module_name  = module_name.to_sym
      @command_name = [module_name, command]
      @args         = args
    end

    def call()
      run_command
      publish_events
      result
    end

    private

    attr_reader :command_name, :module_name, :result, :database, :args, :events_port

    def publish_events
      events_port.send(
        event:   command_name.join('_').to_sym,
        command: result
      )
    end

    def run_command
      @result = Domain.use_cases[command_name]
      .new(
        args:       args,
        repository: database[module_name]
      ).call
    end
  end
end

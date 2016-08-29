module PizzaHexagon
  module Domain
    module Pizzas
      module UseCases
        class Create
          attr_accessor :args, :id, :errors

          def initialize(
            args:,
            database:    Databases::Memory.new,
            events_port: Ports::Events.new)
            @args          = args
            @database      = database
            @events_port   = events_port
          end

          def call(use_case=nil)
            create
            notify_listeners
            self
          end

          def to_h
            { errors: errors, id: database_result, args: args }
          end

          private

          attr_reader :database, :database_result, :events_port

          def notify_listeners
            events_port.send(:pizzas_create, command: self)
          end

          def create
            notify_listeners
            @id = @database_result = database[:pizzas].create(args)
          end
        end
      end
    end
  end
end

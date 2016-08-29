module PizzaHexagon
  module Domain
    module Pizzas
      module UseCases
        class Update
          attr_accessor :args, :errors, :id

          def initialize(
            args:,
            database: Databases::Memory.new,
            events_port: Ports::Events.new)
            @args         = args
            @id           = args[:id]
            @database     = database
            @events_port  = events_port
          end

          def call(use_case=nil)
            update
            notify_listeners
            self
          end

          def to_h
            { id: id, args: args }
          end

          private

          attr_accessor :database, :events_port

          def notify_listeners
            events_port.send(:pizzas_update, command: self)
          end

          def update
            database[:pizzas].update(args[:id], args[:attributes])
          end
        end
      end
    end
  end
end

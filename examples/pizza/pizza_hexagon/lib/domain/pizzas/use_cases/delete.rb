module PizzaHexagon
  module Domain
    module Pizzas
      module UseCases
        class Delete
          attr_accessor :args

          def initialize(args:, database: Databases::Memory.new, events_port: Ports::Events.new)
            @args        = args
            @database    = database
            @events_port = events_port
          end

          def call(use_case=nil)
            delete
            notify_listeners
            self
          end

          def errors
            []
          end

          def to_h
            { errors: errors, args: args }
          end

          private

          attr_accessor :database, :events_port, :command_result

          def notify_listeners
            events_port.send(:pizzas_delete, command: self)
          end

          def delete
            database[:pizzas].delete(args[:id])
          end
        end
      end
    end
  end
end

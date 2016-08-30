module PizzaHexagon
  module Domain
    module Pizzas
      module UseCases
        class Delete
          attr_accessor :args

          def initialize(args:, repository: Repository, events_port: nil)
            @args        = args
            @repository    = repository
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

          attr_accessor :events_port, :command_result, :repository

          def notify_listeners
            return if events_port.nil?
            events_port.send(:pizzas_delete, command: self)
          end

          def delete
            repository.delete(args[:id])
          end
        end
      end
    end
  end
end

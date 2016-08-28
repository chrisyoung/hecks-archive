module PizzaHexagon
  module Domain
    module Pizzas
      module UseCases
        class Create
          attr_accessor :args, :id, :errors

          def initialize(args:, database:, schema: Schemas::Pizza, events_port:)
            @args          = args
            @database      = database
            @schema        = schema
            @events_port   = events_port
          end

          def call(use_case=nil)
            validate
            create
            notify_listeners
            self
          end

          def to_h
            { errors: errors, id: command_result.id, args: args }
          end

          private

          attr_reader :database, :schema, :args, :command_result, :events_port

          def notify_listeners
            events_port.send(:pizzas_create, command: self)
          end

          def validate
            @errors = schema.(args).messages
          end

          def create
            return if errors.keys.count > 0
            notify_listeners
            @command_result = database[:pizzas].create(args)
          end
        end
      end
    end
  end
end

class Ph2
  module Domain
    module Pizzas
      module UseCases
        class Create
          attr_accessor :args, :id, :errors

          def initialize(args:, database_adapter:, schema: Schemas::Pizza, listeners: [])
            @args             = args
            @database_adapter = database_adapter
            @schema           = schema
            @listeners        = listeners
          end

          def call(use_case=nil)
            validate
            create
            notify_listeners
            self
          end

          def to_h
            { errors: errors, id: id, args: args }
          end

          private

          attr_reader :database_adapter, :schema, :args, :listeners

          def notify_listeners
            listeners.each do |listener|
              listener.pizza_created(self) if listener.respond_to?(:pizza_created)
            end
          end

          def validate
            @errors = schema.(args).messages
          end

          def create
            return if errors.keys.count > 0
            notify_listeners
            @id = database_adapter[:pizzas].create(args)
          end
        end
      end
    end
  end
end

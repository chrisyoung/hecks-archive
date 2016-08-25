class Ph2
  module Domain
    module Pizzas
      module UseCases
        class Update
          attr_accessor :args, :errors, :id

          def initialize(args:, database_adapter:, schema: nil)
            @args       = args
            @id = args[:id]
            @database_adapter = database_adapter
            @schema = schema
            @errors = {}
          end

          def call(use_case=nil)
            validate
            update
            self
          end

          private

          attr_accessor :database_adapter, :schema

          def validate
            return unless schema
            @errors = schema.(args[:attributes]).messages
          end

          def update
            return if @errors.keys.count > 0
            database_adapter[:pizzas].update(args[:id], args[:attributes])
          end
        end
      end
    end
  end
end

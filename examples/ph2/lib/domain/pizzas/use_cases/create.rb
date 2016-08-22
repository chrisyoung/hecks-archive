class Ph2
  module Domain
    module Pizzas
      module UseCases
        class Create
          attr_accessor :args, :id, :errors

          def initialize(args:, database_adapter:, schema: Schemas::Pizza)
            @args       = args
            @database_adapter = database_adapter
            @schema = schema
          end

          def call(use_case=nil)
            validate
            create
            self
          end

          def to_h
            {errors: errors, id: id, args: args}
          end

          private

          attr_accessor :database_adapter, :schema, :args

          def validate
            @errors = schema.(args).messages
          end

          def create
            return if @errors.keys.count > 0
            @id = database_adapter[:pizzas].create(args)
          end
        end
      end
    end
  end
end

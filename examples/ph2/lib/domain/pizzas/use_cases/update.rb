class Ph2
  module Domain
    module Pizzas
      module UseCases
        class Update
          attr_accessor :args, :errors, :id

          def initialize(args:, database:, schema: nil)
            @args     = args
            @id       = args[:id]
            @database = database
            @schema   = schema
            @errors   = {}
          end

          def call(use_case=nil)
            validate
            update
            self
          end

          def to_h
            { errors: errors, id: id, args: args }
          end

          private

          attr_accessor :database, :schema

          def validate
            return unless schema
            @errors = schema.(args[:attributes]).messages
          end

          def update
            return if @errors.keys.count > 0
            database[:pizzas].update(args[:id], args[:attributes])
          end
        end
      end
    end
  end
end

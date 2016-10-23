require_relative 'pizza'
module PizzaBuilder
  module Domain
    module Pizzas
      module Schemas
        def self.delete_nested hash, key
          hash.is_a?(Hash) ? hash.inject({}) do |m, (k, v)|
            m[k] = delete_nested v, key unless k == key
            m
          end : hash
        end

        result = {
          '$schema' => 'http://json-schema.org/draft-04/schema'
        }.merge(Pizza)

        Update = delete_nested(result, :required)
      end
    end
  end
end

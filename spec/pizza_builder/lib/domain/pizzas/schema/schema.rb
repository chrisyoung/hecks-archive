require_relative 'topping'
require_relative 'pizza'

module PizzaBuilder
  module Domain
    module Pizzas
      module Schema
        def self.head
          {
            '$schema': 'http://json-schema.org/draft-04/schema',
          }.merge(Schema.pizza)
        end
      end
    end
  end
end

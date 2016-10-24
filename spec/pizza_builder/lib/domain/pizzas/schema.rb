require_relative 'schema/pizza'

module PizzaBuilder
  module Domain
    module Pizzas
      module Schema
        Head =
          {
            '$schema': 'http://json-schema.org/draft-04/schema',
          }.merge(Schema::Pizza)
      end
    end
  end
end

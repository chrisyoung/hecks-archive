require_relative 'pizza'

module PizzaBuilder
  module Domain
    module Pizzas
      module Schemas
        Create = {
          '$schema' => 'http://json-schema.org/draft-04/schema',
        }.merge(Pizza)
      end
    end
  end
end

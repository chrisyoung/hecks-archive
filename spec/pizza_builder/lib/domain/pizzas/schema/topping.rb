module PizzaBuilder
  module Domain
    module Pizzas
      module Schema
        def self.topping
            {
            type:       "object",
            required:   [:name],
            properties: {
              name: { type: 'string' },
              id: { type: 'integer' },
            },
            additionalProperties: false
          }
        end
      end
    end
  end
end

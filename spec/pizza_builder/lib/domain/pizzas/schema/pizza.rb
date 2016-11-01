require_relative 'topping'
module PizzaBuilder
  module Domain
    module Pizzas
      module Schema
        def self.pizza
          {
            type:       "object",
            required:   [:name, :description, :toppings],
            properties: {
              name: { type: 'string' },
              description: { type: 'string' },
              toppings: { items: Schema.topping },
              id: { type: 'integer' },
            },
            additionalProperties: false
          }
        end
      end
    end
  end
end

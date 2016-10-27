require_relative 'topping'
module PizzaBuilder
  module Domain
    module Pizzas
      module Schema
        Pizza = {
          type:       "object",
          required:   [:name, :description, :toppings],
          properties: {
            name: { type: 'string' },
            description: { type: 'string' },
            toppings: { items: Topping },
            id: { type: 'integer' },
          },
          additionalProperties: false
        }
      end
    end
  end
end

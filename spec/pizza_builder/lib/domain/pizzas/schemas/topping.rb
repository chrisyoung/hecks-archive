module PizzaBuilder
  module Domain
    module Pizzas
      module Schemas
        Topping = {
          type: 'object',
          required: [:name],
          properties: { name: { type: "string" } },
          additionalProperties: false
        }
      end
    end
  end
end

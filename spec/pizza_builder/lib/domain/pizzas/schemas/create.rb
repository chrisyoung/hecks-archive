module PizzaBuilder
  module Domain
    module Pizzas
      module Schemas
        Create = {
          '$schema' => 'http://json-schema.org/draft-04/schema',
          type:       "object",
          title:      "pizza",
          required:   [:name, :description, :toppings],
          properties: {
              name: { type: 'string' },
              description: { type: 'string' },
              toppings: { type: '[topping]' },
              id: { type: 'integer' },
          },
          additionalProperties: false

            #toppings: {
            #  type: "array",
            #  items: {
            #    type: 'object',
            #    required:   [:name],
            #    properties: {
            #      name: { type: "string" },
            #    },
            #    additionalProperties: false,
            #  },
            #},
          }
      end
    end
  end
end

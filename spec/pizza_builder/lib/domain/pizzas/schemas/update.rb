module PizzaBuilder
  module Domain
    module Pizzas
      module Schemas
        Update = {
          '$schema' => 'http://json-schema.org/draft-04/schema',
          type:       "object",
          title:      "pizza",
          properties: {
            name:        { type: "string" },
            description: { type: "string" },
            toppings: {
              type: "array",
              items: {
                type: 'object',
                properties: {
                  name: { type: "string" },
                },
                additionalProperties: false,
              },
            },
          },
          additionalProperties: false
        }
      end
    end
  end
end

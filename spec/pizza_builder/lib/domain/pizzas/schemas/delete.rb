module PizzaBuilder
  module Domain
    module Pizzas
      module Schemas
        Delete = {
          '$schema' => 'http://json-schema.org/draft-04/schema',
          type:       "object",
          required:   [:id],
          properties: {
            id: { type: "integer" },
          },
          additionalProperties: false
        }
      end
    end
  end
end

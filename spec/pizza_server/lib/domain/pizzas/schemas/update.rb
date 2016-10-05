# frozen_string_literal: true
module PizzaServer
  module Domain
    module Pizzas
      module Schemas
        Update = {
          '$schema' => 'http://json-schema.org/draft-04/schema',
          type:       'object',
          title:      'pizza',
          properties: {
            name:        { type: 'string' },
            description: { type: 'string' },
            toppings: {
              type: 'array',
              items: {
                type: 'object',
                properties: {
                  name: { type: 'string' }
                },
                additionalProperties: false
              }
            }
          },
          additionalProperties: false
        }.freeze
      end
    end
  end
end

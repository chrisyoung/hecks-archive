# frozen_string_literal: true
module PizzaServer
  module Domain
    module Pizzas
      module Schemas
        Delete = {
          '$schema' => 'http://json-schema.org/draft-04/schema',
          type:       'object',
          required:   [:id],
          properties: {
            id: { type: 'integer' }
          },
          additionalProperties: false
        }.freeze
      end
    end
  end
end

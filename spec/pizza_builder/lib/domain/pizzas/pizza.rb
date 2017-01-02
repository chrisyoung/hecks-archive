module PizzaBuilder
  module Domain
    module Pizzas
      class Pizza
        attr_accessor :name, :description, :toppings, :id
        def initialize(name:, description:, toppings:, id:)
        @name = name
@description = description
@toppings = toppings
@id = id
        end

        def to_json
          JSON.generate(name: name, description: description, toppings: toppings, id: id)
        end
      end
    end
  end
end

module PizzaBuilder
  module Domain
    module Pizzas
      # This is the head of the Pizzas Aggregate.  An
      # Aggregate head is generally an Entity and is the only object
      # that is handled by the Repository and operated on by the application.

      class Pizza
        attr_accessor :name, :description, :toppings, :id
        def initialize(name:, description:, toppings:, id:)

          @name = name
@description = description
@toppings = Topping.factory(toppings)
@id = id

        end

        def to_json
          JSON.generate(name: name, description: description, toppings: toppings, id: id)
        end
      end
    end
  end
end

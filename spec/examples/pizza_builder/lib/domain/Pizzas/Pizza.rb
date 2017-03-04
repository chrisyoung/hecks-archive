module PizzaBuilder
  module Domain
    module Pizzas
      class Pizza
        attr_accessor :name, :description, :toppings, :chef, :id
        def initialize(name:, description:, toppings:, chef:, id:)
        @name = name
@description = description
@toppings = Topping.factory(toppings)
@chef = ChefReference.factory(chef)
@id = id
        end

        def to_json
          JSON.generate(name: name, description: description, toppings: toppings, chef: chef, id: id)
        end
      end
    end
  end
end

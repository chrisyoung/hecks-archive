module PizzaBuilder
  module Domain
    module Pizzas
      class Pizza
        attr_accessor :name, :description, :toppings, :chef, :id
        def initialize(name:, description:, toppings:, chef:, id:)
          @name = name
          @description = description
          @toppings = Topping.factory(toppings)
          @chef = Chef.factory(chef)
          @id = id
        end

        def name=(name)
          @name = name
        end

        def description=(description)
          @description = description
        end

        def toppings=(toppings)
          @toppings = Topping.factory(toppings)
        end

        def chef=(chef)
          @chef = Chef.factory(chef)
        end

        def to_json
          JSON.generate(name: name, description: description, toppings: toppings, chef: chef, id: id)
        end
      end
    end
  end
end

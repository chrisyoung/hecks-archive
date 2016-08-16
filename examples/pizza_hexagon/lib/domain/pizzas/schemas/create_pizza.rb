class PizzaHexagon
  module Domain
    module Pizzas
      module Schemas
        CreatePizza = Dry::Validation.Schema do
          required(:name).filled
          required(:toppings)
        end
      end
    end
  end
end

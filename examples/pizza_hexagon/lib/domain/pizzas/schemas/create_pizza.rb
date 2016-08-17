class PizzaHexagon
  module Domain
    module Pizzas
      module Schemas
        CreatePizza = Dry::Validation.Schema do
          required(:name).filled
          required(:toppings).filled
        end
      end
    end
  end
end

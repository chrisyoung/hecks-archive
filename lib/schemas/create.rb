module PizzaServerHexagon
  module Schemas
    module Pizzas
      Create = Dry::Validation.Schema do
        required(:name).filled(:str?)
        required(:description).filled(:str?)
        required(:toppings).schema do
          optional(:name).filled(:str?)
        end
      end
    end
  end
end

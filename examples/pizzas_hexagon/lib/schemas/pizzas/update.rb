module PizzasHexagon
  module Schemas
    module Pizzas
      Update = Dry::Validation.Schema do
        optional(:name).filled(:str?)
        optional(:description).filled(:str?)
        optional(:toppings).each(:str?)
      end
    end
  end
end

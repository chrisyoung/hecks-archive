module PizzaServerHexagon
  module Schemas
    module Pizzas
      Create = Dry::Validation.Schema do
        require(:name).filled(:str?)
        require(:description).filled(:str?)
        require(:toppings).filled(:str?)
      end
    end
  end
end

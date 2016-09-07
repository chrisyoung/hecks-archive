module PizzasHexagon
  module Schemas
    module Pizzas
      Create = Dry::Validation.Schema do
        # required(:name).filled(:str?)
        # required(:description).filled(:str?)
        # required(:toppings).schema do
        #   required(:name).each.filled(:str?)
        # end
      end
    end
  end
end

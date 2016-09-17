module PizzaServerHexagon
  module Schemas
    module Test
      Delete = Dry::Validation.Schema do
        # required(:name).filled(:str?)
        # required(:description).filled(:str?)
        # required(:toppings).each(:str?)
      end
    end
  end
end

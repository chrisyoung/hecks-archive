module PizzaServerHexagon
  module Schemas
    module Test
      Update = Dry::Validation.Schema do
        # required(:id).filled(:int?)
        # required(:attributes).schema do
        #   optional(:name).filled(:str?)
        #   optional(:description).filled(:str?)
        #   optional(:toppings).each(:str?)
        # end
      end
    end
  end
end

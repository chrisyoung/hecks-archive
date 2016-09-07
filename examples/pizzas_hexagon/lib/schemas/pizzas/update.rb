module PizzasHexagon
  module Schemas
    module Pizzas
      Update = Dry::Validation.Schema do
        # required(:name).maybe(:str?)
        # required(:description).maybe(:str?)
        # required(:toppings).schema do
        #   required(:name).each.maybe(:str?)
        # end
      end
    end
  end
end

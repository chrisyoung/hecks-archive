class Ph2
  module Domain
    module Pizzas
      module Schemas
        Pizza = Dry::Validation.Schema do
          required(:name).filled
					required(:description).filled
					required(:toppings).filled
        end
      end
    end
  end
end

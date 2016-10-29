module Hecks
  module Adapters
    class SQLDatabase
      module Repositories
        class Pizzas
          def create(pizza_attributes)
            toppings = pizza_attributes.delete(:toppings)
            pizza = Models::Pizza.create(pizza_attributes)

            toppings.each do |topping_attributes|
              topping = Models::Topping.create(topping_attributes)
              Models::PizzaTopping.create({
                pizza_id: pizza.id,
                topping_id: topping.id
              })
            end
          end
        end
      end
    end
  end
end

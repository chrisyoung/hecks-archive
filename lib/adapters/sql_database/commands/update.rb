module Hecks
  module Adapters
    class SQLDatabase
      module Commands
        class Update
          def initialize(attributes)
            @toppings_attributes = attributes.delete(:toppings)
            @pizza_attributes    = attributes
          end

          def call
            create_pizza
            create_toppings
            link_toppings
            self
          end

          private

          attr_reader :pizza_attributes, :pizza
          attr_reader :toppings_attributes, :toppings

          def create_pizza
            @pizza = Models::Pizza.create(pizza_attributes)
          end

          def create_toppings
            @toppings =
            toppings_attributes.map do |attributes|
              Models::Topping.create(attributes)
            end
          end

          def link_toppings
            toppings.each do |topping|
              Models::PizzaTopping.create(
                pizza_id: pizza.id,
                topping_id: topping.id
              )
            end
          end
        end
      end
    end
  end
end

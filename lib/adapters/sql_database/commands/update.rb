module Hecks
  module Adapters
    class SQLDatabase
      module Commands
        class Update
          def initialize(id, attributes)
            @id = id
            attributes = attributes.clone
            @toppings_attributes = attributes.delete(:toppings)
            @pizza_attributes    = attributes
          end

          def call
            update_pizza
            create_toppings
            link_toppings
            self
          end

          private

          attr_reader :pizza_attributes, :pizza, :id
          attr_reader :toppings_attributes, :toppings

          def update_pizza
            @pizza = Models::Pizza.where(id: id).first
            pizza.update(pizza_attributes)
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
                name: topping.name
              )
            end
          end
        end
      end
    end
  end
end

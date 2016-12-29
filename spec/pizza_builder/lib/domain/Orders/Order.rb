module PizzaBuilder
  module Domain
    module Orders
      # This is the head of the Pizzas Aggregate.  An
      # Aggregate head is generally an Entity and is the only object
      # that is handled by the Repository and operated on by the application.

      class Order
        attr_accessor :pizza, :id
        def initialize(pizza:, id:)

          @pizza = Pizzas::Pizza.factory(pizza)
@id = id

        end

        def to_json
          JSON.generate(pizza: pizza, id: id)
        end
      end
    end
  end
end

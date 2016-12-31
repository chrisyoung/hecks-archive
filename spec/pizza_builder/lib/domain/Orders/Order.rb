module PizzaBuilder
  module Domain
    module Orders
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

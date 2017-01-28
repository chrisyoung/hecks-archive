module PizzaBuilder
  module Domain
    module Orders
      class Pizza
        attr_accessor :name, :toppings

        def self.factory(pizza_group_attributes)
          pizza_group_attributes.map do |attributes|
            Pizza.new(attributes)
          end
        end

        def initialize(name:, toppings:)
          @name = name
          @toppings = toppings
        end

        def to_json(config)
          JSON.generate(name: name, toppings: toppings)
        end
      end
    end
  end
end

module PizzaBuilder
  module Domain
    module Orders
      class LineItem
        attr_accessor :pizza_name, :quantity, :price, :pizza

        def self.factory(group_attributes)
          return if group_attributes.nil?
          return LineItem.new(group_attributes) unless group_attributes.is_a?(Array)
          group_attributes.map do |attributes|
            LineItem.new(attributes)
          end
        end

        def initialize(attributes={})
          @pizza_name = attributes[:pizza_name]
          @quantity = attributes[:quantity]
          @price = attributes[:price]
          @pizza = PizzaReference.factory(attributes[:pizza])
        end

        def pizza_name=(pizza_name)
          @pizza_name = pizza_name
        end

        def quantity=(quantity)
          @quantity = quantity
        end

        def price=(price)
          @price = price
        end

        def pizza=(pizza)
          @pizza = PizzaReference.factory(pizza)
        end

        def to_json(config)
          JSON.generate(pizza_name: pizza_name, quantity: quantity, price: price, pizza: pizza)
        end
      end
    end
  end
end

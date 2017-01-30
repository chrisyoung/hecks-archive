module PizzaBuilder
  module Domain
    module Orders
      class LineItem
        attr_accessor :pizza, :quantity, :price

        def self.factory(lineitem_group_attributes)
          lineitem_group_attributes.map do |attributes|
            LineItem.new(attributes)
          end
        end

        def initialize(pizza:, quantity:, price:)
          @pizza = Pizza.new(pizza)
          @quantity = quantity
          @price = price
        end

        def to_json(config)
          JSON.generate(pizza: pizza, quantity: quantity, price: price)
        end
      end
    end
  end
end

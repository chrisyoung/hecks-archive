module PizzaBuilder
  module Domain
    module Orders
      class LineItem
        attr_accessor :pizza_name, :quantity, :price

        def self.factory(lineitem_group_attributes)
          lineitem_group_attributes.map do |attributes|
            LineItem.new(attributes)
          end
        end

        def initialize(pizza_name:, quantity:, price:)
          @pizza_name = pizza_name
@quantity = quantity
@price = price
        end

        def to_json(config)
          JSON.generate(pizza_name: pizza_name, quantity: quantity, price: price)
        end
      end
    end
  end
end

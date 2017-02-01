module PizzaBuilder
  module Domain
    module Orders
      class LineItem
        attr_accessor :pizza_name, :quantity, :price

        def self.factory(group_attributes)
          return LineItem.new(group_attributes) unless group_attributes.is_a?(Array)
          group_attributes.map do |attributes|
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

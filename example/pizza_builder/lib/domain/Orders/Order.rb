module PizzaBuilder
  module Domain
    module Orders
      class Order
        attr_accessor :line_items, :id
        def initialize(attributes={})
          @line_items = LineItem.factory(attributes[:line_items])
          @id = attributes[:id]
        end

        def line_items=(line_items)
          @line_items = LineItem.factory(line_items)
        end

        def to_json
          JSON.generate(line_items: line_items, id: id)
        end
      end
    end
  end
end

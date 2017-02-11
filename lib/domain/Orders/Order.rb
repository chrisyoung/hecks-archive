module Hecks
  module Domain
    module Orders
      class Order
        attr_accessor :line_items, :id
        def initialize(line_items:, id:)
        @line_items = LineItem.factory(line_items)
@id = id
        end

        def to_json
          JSON.generate(line_items: line_items, id: id)
        end
      end
    end
  end
end

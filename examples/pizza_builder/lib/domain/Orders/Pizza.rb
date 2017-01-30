module PizzaBuilder
  module Domain
    module Orders
      class Pizza
        attr_accessor :name, :id

        def self.factory(pizza_group_attributes)
          pizza_group_attributes.map do |attributes|
            Pizza.new(attributes)
          end
        end

        def initialize(name:, id:)
          @name = name
          @id = id
        end

        def to_json(config)
          JSON.generate(name: name, id: id)
        end
      end
    end
  end
end

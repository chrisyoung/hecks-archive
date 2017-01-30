module PizzaBuilder
  module Domain
    module Orders
      class Pizza
        attr_accessor :name

        def self.factory(pizza_group_attributes)
          pizza_group_attributes.map do |attributes|
            Pizza.new(attributes)
          end
        end

        def initialize(name:)
          @name = name
        end

        def to_json(config)
          JSON.generate(name: name)
        end
      end
    end
  end
end

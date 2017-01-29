module PizzaBuilder
  module Domain
    module Pizzas
      class Topping
        attr_accessor 

        def self.factory(topping_group_attributes)
          topping_group_attributes.map do |attributes|
            Topping.new(attributes)
          end
        end

        def initialize()
        end

        def to_json(config)
          JSON.generate()
        end
      end
    end
  end
end

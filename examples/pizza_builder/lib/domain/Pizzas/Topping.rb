module PizzaBuilder
  module Domain
    module Pizzas
      class Topping
        attr_accessor :name

        def self.factory(topping_group_attributes)
          topping_group_attributes.map do |attributes|
            Topping.new(attributes)
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

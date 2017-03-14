module PizzaBuilder
  module Domain
    module Pizzas
      class Topping
        attr_accessor :name

        def self.factory(group_attributes)
          return Topping.new(group_attributes) unless group_attributes.is_a?(Array)
          group_attributes.map do |attributes|
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

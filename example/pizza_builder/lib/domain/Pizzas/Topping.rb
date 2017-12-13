module PizzaBuilder
  module Domain
    module Pizzas
      class Topping
        attr_accessor :name

        def self.factory(group_attributes)
          return if group_attributes.nil?
          return Topping.new(group_attributes) unless group_attributes.is_a?(Array)
          group_attributes.map do |attributes|
            Topping.new(attributes)
          end
        end

        def initialize(attributes={})
          @name = attributes[:name]
        end

        def name=(name)
          @name = name
        end

        def to_json(config)
          JSON.generate(name: name)
        end
      end
    end
  end
end

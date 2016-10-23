module PizzaBuilder
  module Domain
    module Pizzas
      # This is the head of the Pizzas Aggregate.  An
      # Aggregate head is generally an Entity and is the only object
      # that is handled by the Repository and operated on by the application.

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

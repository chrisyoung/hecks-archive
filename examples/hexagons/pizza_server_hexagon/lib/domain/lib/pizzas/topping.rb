module PizzaServerHexagon
  module Domain
    module Pizzas
      # This is the head of the Pizzas Aggregate.  An
      # Aggregate head is generally an Entity and is the only object
      # that is handled by the Repository and operated on by the application.

      class Topping
        attr_accessor :name
        def initialize(name:)
          
            @name = name
          
        end

        def to_json
          JSON.generate(name: name)
        end
      end
    end
  end
end

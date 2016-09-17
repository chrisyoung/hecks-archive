module PizzaServerHexagon
  module Domain
    module Test
      # This is the head of the Pizzas Aggregate.  An
      # Aggregate head is generally an Entity and is the only object
      # that is handled by the Repository and operated on by the application.

      class Entity
        attr_accessor :id, :name, :children
        def initialize(id:, name:, children:)
          @id = id
          @name = name
          @children = children
        end

        def to_json
          JSON.generate(name: @name, children: @children, id: @id)
        end
      end
    end
  end
end

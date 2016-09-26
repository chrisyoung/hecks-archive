module PizzaServerHexagon
  module Domain
    module ModuleName
      # This is the head of the Pizzas Aggregate.  An
      # Aggregate head is generally an Entity and is the only object
      # that is handled by the Repository and operated on by the application.

      class module_name
        attr_accessor ["name", "id"]
        def initialize(:name, :id)
          
            @name = name
          
            @id = id
          
        end

        def to_json
          JSON.generate(name: name, id: id)
        end
      end
    end
  end
end

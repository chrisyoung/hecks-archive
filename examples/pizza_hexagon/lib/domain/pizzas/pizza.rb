module PizzaHexagon::Domain::Pizzas
  # This is the head of the Pizzas Aggregate.  An
  # Aggregate head is generally an Entity and is the only object
  # that is handled by the Repository and operated on by the application.

  class Pizza
    attr_accessor :id, :name, :toppings
    def initialize id:, name:, toppings:
      @id       = id
      @name     = name
      @toppings = toppings
    end

    def to_json
      {id: id, name: name, toppings: toppings}.to_json
    end
  end
end

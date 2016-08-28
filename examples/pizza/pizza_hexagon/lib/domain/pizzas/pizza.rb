module PizzaHexagon::Domain::Pizzas
  # This is the head of the Pizzas Aggregate.  An
  # Aggregate head is generally an Entity and is the only object
  # that is handled by the Repository and operated on by the application.

  class Pizza
    attr_accessor :id, :name, :description, :toppings
    def initialize(id:, name:, description:, toppings:)
      @id = id
      @name = name
			@description = description
			@toppings = toppings
    end
  end
end

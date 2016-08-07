module PizzaHexagon::Domain::Pizzas
  class Topping
    attr_accessor :name
    def initialize(name:)
      @name = name
    end
  end
end

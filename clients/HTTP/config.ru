require_relative './server'
require_relative '../../examples/pizza_hexagon/pizza_hexagon'
run Server.new(hexagon: PizzaHexagon.new)

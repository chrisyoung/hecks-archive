require_relative '../../examples/pizza_hexagon/pizza_hexagon'

Domain = PizzaHexagon::Domain
require_relative './server'
run Server.new(hexagon: PizzaHexagon.new)

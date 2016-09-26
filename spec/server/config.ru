require_relative 'env'
# database = Adapters::Databases::ActiveRecord.new

hexagon = Hecks.hexagons[:pizza_server_hexagon]

# PizzaServerDemoHexagon::App.new
# Adapters talk to ports, I think App is a port

run hexagon.adapters[:resource_server]
# run(PizzaServerHexagon::Adapters::ResourceServer::App.new(hexagon: hexagon))

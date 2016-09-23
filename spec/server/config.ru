require_relative 'env'
# database = Adapters::Databases::ActiveRecord.new
hexagon = PizzaServerDemoHexagon::App.new
run(PizzaServerDemoHexagon::Adapters::ResourceServer::App.new(hexagon: hexagon))

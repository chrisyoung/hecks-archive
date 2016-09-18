require_relative 'env'
# database = Adapters::Databases::ActiveRecord.new
hexagon = PizzaServerHexagon::App.new
run(PizzaServerHexagon::Adapters::ResourceServer::App.new(hexagon: hexagon))

require_relative 'env'
# database = Adapters::Databases::ActiveRecord.new
hexagon = PizzaServerXHexagon::App.new
run(PizzaServerXHexagon::Adapters::ResourceServer::App.new(hexagon: hexagon))

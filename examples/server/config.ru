require_relative 'env'
# database = Adapters::Databases::ActiveRecord.new
hexagon = PizzasHexagon::App.new
run(
  PizzasHexagon::Adapters::ResourceServer::App.new(hexagon: hexagon)
)

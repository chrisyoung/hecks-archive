require_relative 'env'
# database = Adapters::Databases::ActiveRecord.new
hexagon  = PizzasHexagon::App.new
run(
  Hecks::ResourceServer::App.new(hexagon: hexagon)
)

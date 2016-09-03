require_relative 'env'
# database = Adapters::Databases::ActiveRecord.new
hexagon  = Pizzas::App.new
run(Hecks::ResourceServer::App.new(hexagon: hexagon))

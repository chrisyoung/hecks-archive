require_relative 'env'
# database = Databases::ActiveRecord.new
hexagon  = Pizzas::App.new
run(Hecks::ResourceServer::App.new(hexagon: hexagon))

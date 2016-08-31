require_relative 'env'
database = Databases::ActiveRecord.new
hexagon  = Pizzas::App.new(database: database)
run(Server.new(hexagon: hexagon))

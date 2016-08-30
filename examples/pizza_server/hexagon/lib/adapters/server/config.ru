require_relative 'env'
database = Databases::ActiveRecord.new
hexagon  = PizzaHexagon::App.new(database: database)
run(Server.new(hexagon: hexagon))

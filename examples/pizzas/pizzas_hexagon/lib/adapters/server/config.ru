require_relative 'env'
# database = Databases::ActiveRecord.new
hexagon  = Pizzas::App.new

run(Server.new(hexagon: hexagon))

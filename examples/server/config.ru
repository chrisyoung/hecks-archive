require_relative 'env'

database  = Databases::ActiveRecord.new
hexagon   = Ph2::App.new(database: database)

run(Server.new(hexagon: hexagon))

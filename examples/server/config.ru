require_relative 'env'

database  = Databases::ActiveRecord.new
hexagon   =  Ph2.new(database: database)

run(Server.new(hexagon: hexagon))

require_relative '../ph2/ph2'
require_relative '../ph2/lib/databases/active_record'
Domain = Ph2::Domain
require_relative '../../clients/HTTP/server'

run Server.new(hexagon: Ph2.new(database_adapter: Databases::ActiveRecord.new))
run Server.new(hexagon: Ph2.new)

require_relative '../../examples/ph2/ph2'
require_relative '../../examples/ph2/lib/databases/active_record'

Domain = Ph2::Domain
require_relative './server'
run Server.new(hexagon: Ph2.new(database_adapter: Databases::ActiveRecord.new)
)

require_relative '../../examples/ph2/ph2'
Domain = Ph2::Domain
require_relative './server'
run Server.new(hexagon: Ph2.new)

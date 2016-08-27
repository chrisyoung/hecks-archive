require_relative '../ph2/ph2'
require_relative '../ph2/lib/databases/active_record'
Domain = Ph2::Domain
require_relative '../../clients/HTTP/server'

database = Databases::ActiveRecord.new
listeners = [PizzaCreatedListener.new]

class PizzaCreatedListener
  def pizzas_create(command)
  end
end

hexagon = hexagon: Ph2.new(database: database, listeners: listeners)

run Server.new(hexagon)

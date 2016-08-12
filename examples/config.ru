require_relative 'server'

class Resource
  attr_reader :name
  def initialize(constant_name)
    @name = constant_name.to_s.downcase
  end
end

app = Rack::Builder.new do
  use Rack::Reloader, 0
  PizzaHexagon::Domain.constants.each do |constant_name|
    resource = Resource.new(constant_name)
    map "/#{resource.name}" do
      run PizzaServer.new(hexagon: PizzaHexagon.new, domain_module: resource.name)
    end
  end
end

run app

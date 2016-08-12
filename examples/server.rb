# run the Smaller Web Hexagon from a browser

require_relative './pizza_hexagon/pizza_hexagon'
require 'rack'
require 'pry'

class PizzaServer
  def initialize(hexagon: hexagon, domain_module: nil)
    @hexagon = hexagon
    @domain_module = domain_module
  end

  def call(env)
    request  = Rack::Request.new(env)
    response = Rack::Response.new

    response.write(hexagon.run(
      @domain_module.to_sym,
      :create_pizza,
      request.params
    ).id)
    response.finish
  end

  private

  attr_reader :hexagon
end

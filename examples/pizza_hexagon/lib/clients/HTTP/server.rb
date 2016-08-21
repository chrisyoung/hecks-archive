require 'sinatra/base'
require 'json'
require_relative '../../../pizza_hexagon'
require_relative 'methods'
require 'pry'
class Server < Sinatra::Base
  hexagon = PizzaHexagon.new

  PizzaHexagon::Domain.modules.each do |name|
    post "/#{name}" do
      Create.new(hexagon: hexagon)
        .call(body: request.body, module_name: name)
    end

    get "/#{name}/:id" do |id|
      Read.new(hexagon: hexagon)
        .call(id: id.to_i, module_name: name)
    end

    put "/#{name}/:id" do |id|
      Update.new(hexagon: hexagon)
        .call(id: id, body: request.body, module_name: name)
    end

    delete "/#{name}/:id" do |id|
      Delete.new(hexagon: hexagon)
        .call(id: id, module_name: name)
    end

  end
end

require 'sinatra/base'
require 'json'
require_relative 'methods'
require_relative '../../../pizza_hexagon'

class Server < Sinatra::Base
  methods = Methods.new(hexagon: PizzaHexagon.new)

  PizzaHexagon::Domain.modules.each do |name|
    post "/#{name}" do
      methods.create.call(body: request.body, module_name: name)
    end

    get "/#{name}/:id" do |id|
      methods.read.call(id: id, module_name: name)
    end

    put "/#{name}/:id" do |id|
      methods.update.call(id: id, body: request.body, module_name: name)
    end

    delete "/#{name}/:id" do |id|
      methods.delete.call(id: id, module_name: name)
    end
  end
end

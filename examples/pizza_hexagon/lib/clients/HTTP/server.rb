require 'sinatra'
require "sinatra/reloader" if development?
require 'json'
require_relative '../../../pizza_hexagon'
require_relative 'update'
require_relative 'read'
require_relative 'create'

hexagon = PizzaHexagon.new

PizzaHexagon::Domain.modules.each do |domain_module|
  post "/#{domain_module.to_s.downcase}" do
    Create.new(hexagon: hexagon).call(
      body: request.body,
      module_name: domain_module.to_s.downcase
    )
  end

  get "/#{domain_module.to_s.downcase}/:id" do |id|
    Read.new(hexagon: hexagon).call(
      id: id.to_i,
      module_name: domain_module.to_s.downcase
    )
  end

  put "/#{domain_module.to_s.downcase}/:id" do |id|
    Update.new(hexagon: hexagon).call(
      id: id,
      body: request.body,
      module_name: domain_module.to_s.downcase)
  end
end

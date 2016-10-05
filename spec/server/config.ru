# frozen_string_literal: true
require_relative 'env'
run(PizzaServerHexagon::Adapters::ResourceServer::App.new(hexagon: PizzaServerHexagon::App.new))

# frozen_string_literal: true
require_relative 'env'
run(Hecks::Adapters::ResourceServer::App.new(domain: PizzaBuilder))

require_relative "lib/pizza_builder.rb"
require 'hecks'

module PizzaBuilder
  def self.app
    Hecks::Adapters::ResourceServer::App.new(
      application_adapter: Hecks::Adapters::Application.new(
        domain: PizzaBuilder
      )
    )
  end
end

run PizzaBuilder.app

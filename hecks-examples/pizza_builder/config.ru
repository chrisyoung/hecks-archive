require_relative "lib/pizza_builder.rb"
require 'hecks'

run HecksAdapters::ResourceServer.new(
  application_adapter: HecksApplication.new(
    domain: PizzaBuilder
  )
)

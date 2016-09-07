require_relative 'schemas/pizzas/create'
require_relative 'schemas/pizzas/update'
require_relative 'schemas/pizzas/delete'

module PizzasHexagon
  module Schemas
    def self.fetch(command:)
      Schemas
        .const_get(command.name.module.capitalize)
        .const_get(command.name.name.capitalize)
    end
  end
end

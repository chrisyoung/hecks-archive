require_relative 'pizzas/create'
require_relative 'pizzas/update'
require_relative 'pizzas/delete'

module PizzasHexagon
  module Schemas
    def self.fetch(command:)
      Schemas
        .const_get(command.name.module.capitalize)
        .const_get(command.name.name.capitalize)
    end
  end
end

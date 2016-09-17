module PizzaServerXHexagon
  module Schemas
    def self.fetch(command:)
      Schemas
        .const_get(command.name.module.capitalize)
        .const_get(command.name.name.capitalize)
    end
  end
end

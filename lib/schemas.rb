# frozen_string_literal: true
Dir[File.dirname(__FILE__) + '/schemas/**/*.rb'].each do |file|
  require file
end

module PizzaServerHexagon
  module Schemas
    def self.fetch(command:)
      binding.pry
      Schemas
        .const_get(command.name.module.capitalize)
        .const_get(command.name.name.capitalize)
    end
  end
end

require_relative 'pizzas/create'
require_relative 'pizzas/read'
require_relative 'pizzas/update'

module PizzaBuilder
  module Domain
    module Pizzas
      class SQLRepository
        def self.create attributes = {}
          Create.new(attributes).call
        end

        def self.update attributes
          Update.new(attributes: attributes, domain_module: DOMAIN.domain_modules[:Pizzas]).call
        end

        def self.read id
          Read.new(id).call
        end

        def self.delete id
          pizza = Pizza.find(id)
          pizza.destroy
        end

        def self.delete_all
          # Not implemented
        end
      end
    end
  end
end

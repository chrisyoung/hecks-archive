Commands = Hecks::Domain::Adapters::SQLDatabase::Commands
module PizzaBuilder
  module Domain
    module Pizzas
      class SQLRepository
        def self.create attributes = {}
          Commands::Create.new(attributes).call
        end

        def self.update attributes
          Commands::Update.new(attributes: attributes, domain_module: DOMAIN.domain_modules[:Pizzas]).call
        end

        def self.read id
          Pizza.new(Commands::Read.new(id).call)
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

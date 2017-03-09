Commands = Hecks::Domain::Adapters::SQLDatabase::Commands
module PizzaBuilder
  module Domain
    module Pizzas
      class SQLRepository
        def self.create attributes = {}
          Commands::Create.new(attributes).call
        end

        def self.update attributes
          Commands::Update.new(
            attributes: attributes,
            head: DOMAIN.domain_modules[:Pizzas].head
          ).call
        end

        def self.read id
          Pizza.new Commands::Read.new(id).call
        end

        def self.delete id
          Pizza.find(id).destroy
        end

        def self.delete_all
          # Not implemented
        end
      end
    end
  end
end

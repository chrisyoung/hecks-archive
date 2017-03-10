Commands = Hecks::Adapters::SQLDatabase::Commands
module PizzaBuilder
  module Domain
    module Pizzas
      class SQLRepository
        def self.create attributes = {}
          Commands::Create.new(attributes).call
        end

        def self.update attributes
          head = DOMAIN.domain_modules[:Pizzas].head
          Commands::Update.new(attributes: attributes, head: head).call
        end

        def self.read id
          head = DOMAIN.domain_modules[:Pizzas].head
          record = Commands::Read.new(id, head).call
          Pizza.new(record) if record
        end

        def self.delete id
          head = DOMAIN.domain_modules[:Pizzas].head
          Commands::Delete.new(id: id, head: head).call
        end

        def self.delete_all
          # Not implemented
        end
      end
    end
  end
end

Commands = Hecks::Adapters::SQLDatabase::Commands
module PizzaBuilder
  module Domain
    module Pizzas
      class SQLRepository
        def self.create attributes
          Commands::Create.new(
            attributes: attributes,
            domain_module: DOMAIN[:Pizzas]
          ).call
        end

        def self.update attributes
          head = DOMAIN[:Pizzas].head
          Commands::Update.new(attributes: attributes, head: head).call
        end

        def self.read id
          head = DOMAIN[:Pizzas].head
          record = Commands::Read.new(id, head).call
          Pizza.new(record) if record
        end

        def self.delete id
          head = DOMAIN[:Pizzas].head
          Commands::Delete.new(id: id, head: head).call
        end
      end
    end
  end
end

module Hecks
  module Adapters
    class SQLDatabase
      class Repository
        def initialize(module_name:)
          @module_name = module_name
          @head = DOMAIN[module_name].head
        end

        def create attributes
          Commands::Create.new(attributes: attributes, head: @head).call
        end

        def update attributes
          Commands::Update.new(attributes: attributes, head: @head).call
        end

        def read id
          domain_object.new(Commands::Read.new(id, @head).call) if record
        end

        def delete id
          Commands::Delete.new(id: id, head: @head).call
        end

        private

        def domain_object
          DOMAIN.name.camelcase.constantize::Domain.const_get(@module_name).head
        end
      end
    end
  end
end

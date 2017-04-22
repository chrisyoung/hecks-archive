module HecksAdapters
  class SQLDatabase
    class Repository
      def initialize(module_name:)
        @module_name = module_name
        @head = DOMAIN[module_name].head
      end

      def create attributes
        Commands::Create.new(attributes: attributes, head: @head).call
      end

      def update id, attributes
        Commands::Update.new(id: id, attributes: attributes, head: @head).call
      end

      def read id
        Commands::Read.new(
          id: id,
          head: @head,
          entity_class: entity_class
        ).call
      end

      def delete id
        Commands::Delete.new(id: id, head: @head).call
      end

      private

      def entity_class
        DOMAIN.name.camelcase.constantize::Domain.const_get(@module_name).head
      end
    end
  end
end

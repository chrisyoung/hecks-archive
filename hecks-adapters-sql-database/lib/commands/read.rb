require_relative 'read/fetch_references'
module HecksAdapters
  class SQLDatabase
    module Commands
      # Read a resource
      class Read
        attr_reader :head, :entity, :table, :id

        def initialize(id:, head:, entity_class:)
          @head = head
          @table = Table.factory([@head]).first
          @id = id
          @entity_class = entity_class
        end

        def call
          fetch_entity
          return if @entity.nil?
          @entity_class.new(
            @entity.merge(FetchReferences.new(self).call.reference_map)
          )
        end

        private

        def fetch_entity
          @entity = DB[@table.name.to_sym].first(id: @id)
        end
      end
    end
  end
end

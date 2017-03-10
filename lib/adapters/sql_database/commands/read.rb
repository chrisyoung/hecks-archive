require_relative 'read/fetch_references'
module Hecks
  module Adapters
    module SQLDatabase
      module Commands
        class Read
          attr_reader :head, :entity, :table, :id

          def initialize(id, head)
            @head = head
            @table = Table.factory([@head]).first
            @id = id
          end

          def call
            fetch_entity
            return if @entity.nil?
            @entity.merge(FetchReferences.new(self).call.reference_map)
          end

          private

          def fetch_entity
            @entity = DB[@table.name.to_sym].first(id: @id)
          end
        end
      end
    end
  end
end

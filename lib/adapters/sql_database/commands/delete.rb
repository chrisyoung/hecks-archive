module Hecks
  module Adapters
    class SQLDatabase
      module Commands
        class Delete
          def initialize(id:, head:)
            @id = id
            @head = head
          end

          def call
            table = Table.factory([@head]).first
            DB[table.name.to_sym].where(id: @id).delete
            self
          end
        end
      end
    end
  end
end

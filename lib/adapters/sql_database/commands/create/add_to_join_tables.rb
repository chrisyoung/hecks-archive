module Hecks
  module Adapters
    module SQLDatabase
      module Commands
        class Create
          class AddToJoinTables
            attr_reader :reference_ids
            def initialize(head:, reference_ids:, id:)
              @head = head
              @table = Table.factory([@head]).first
              @reference_ids = reference_ids
              @id = id
            end

            def call
              @head.references.each do |reference|
                column = Column.factory(reference)
                join_table = JoinTable.new(@table, column)

                next unless reference.list?

                @reference_ids[reference.name.downcase].each do |id|
                  DB[join_table.name.to_sym].insert(record(column, id))
                end
              end
              self
            end

            private

            def record(column, id)
              [[@table.to_foreign_key, @id], [(column.to_foreign_key).to_sym, id]].to_h
            end
          end
        end
      end
    end
  end
end

module HecksAdapters
  class SQLDatabase
    module Commands
      class Read
        class FetchReferences
          attr_reader :reference_map
          def initialize(read_command)
            @head = read_command.head
            @reference_map = {}
            @entity = read_command.entity
            @table = read_command.table
            @id = read_command.id
          end

          def call
            @head.references.each do |reference|
              fetch_reference(reference)
              fetch_references(reference)
            end
            self
          end

          private

          def fetch_reference(reference)
            return if reference.list?
            column = Column.factory(reference)
            value = DB[column.to_table_name].first(id: @entity[column.to_foreign_key])

            @entity.delete(column.to_foreign_key)
            value.delete(:id)
            @reference_map[column.name.to_sym] = value
          end

          def fetch_references(reference)
            return unless reference.list?

            where_clause = {}
            where_clause[@table.to_foreign_key.to_sym] = @id
            column = Column.factory(reference)

            @reference_map[column.name.to_sym] ||= []

            DB[JoinTable.new(@table, reference).name.to_sym].where(where_clause).map do |record|
              value_object = DB[column.to_table_name].first(id: record[column.to_foreign_key])
              value_object.delete(:id)
              @reference_map[column.name.to_sym] << value_object
            end
          end
        end
      end
    end
  end
end

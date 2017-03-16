module Hecks
  module Adapters
    class SQLDatabase
      module Commands
        class Update
          class LinkToReferences
            attr_reader :reference_ids
            def initialize(reference:, table:, reference_ids:, attributes:, id:)
              @reference = reference
              @reference_ids = reference_ids
              @table = table
              @attributes = attributes
              @column = Column.factory(@reference)
              @record = {}
              @id = id
            end

            def call
              make_linking_records
              make_foreign_keys
              self
            end

            private

            def make_linking_records
              return unless @reference.list?
              @reference_ids[@reference.name.to_sym].each do |value|
                @record[@column.to_foreign_key] = value
                @record[@table.to_foreign_key] = @id
                DB[JoinTable.new(@table, @reference).name.to_sym].insert(@record)
              end
            end

            def make_foreign_keys
              return if @reference.list?
              @attributes[@column.to_foreign_key] = @reference_ids[@reference.name]
            end
          end
        end
      end
    end
  end
end

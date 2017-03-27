module Hecks
  module Adapters
    class SQLDatabase
      module Commands
        class Create
          class FindOrCreateReferences
            attr_reader :reference_ids

            def initialize(head:, attributes:)
              @head = head
              @attributes = attributes
              @reference_ids = {}
            end

            def call
              find_or_create_reference
              find_or_create_references
              self
            end

            private

            def find_or_create_reference
              @head.references.each do |reference|
                next if reference.list?
                attributes = @attributes.delete(reference.name.to_sym)
                column = Column.factory(reference)
                result = DB[column.to_table_name].first(attributes)

                @reference_ids[reference.name] = result[:id] and return if result
                @reference_ids[reference.name] = DB[column.to_table_name].insert(attributes)
              end
            end

            def find_or_create_references
              @head.references.each do |reference|
                next unless reference.list?
                attributes = @attributes.delete(reference.name.to_sym)
                attributes.each do |attributes|
                  @reference_ids[reference.name] = [] unless @reference_ids[reference.name]

                  column = Column.factory(reference)
                  result = DB[column.to_table_name].first(attributes)

                  @reference_ids[reference.name] << result[:id] and return if result
                  @reference_ids[reference.name] << DB[column.to_table_name].insert(attributes)
                end
              end
            end
          end
        end
      end
    end
  end
end

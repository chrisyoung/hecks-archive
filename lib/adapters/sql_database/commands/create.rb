require_relative 'create/find_or_create_references'
require_relative 'create/add_to_join_tables'

module Hecks
  module Adapters
    class SQLDatabase
      module Commands
        class Create
          attr_reader :id

          def initialize(attributes:, head:)
            @attributes = attributes
            @reference_ids = {}
            @head = head
            @references = @head.references
            @table = Table.factory([@head]).first
          end

          def call
            DB.transaction do
              find_or_create_references
              create
              add_to_join_tables
            end
            self
          end

          private

          def find_or_create_references
            @reference_ids =
            FindOrCreateReferences.new(
              head: @head,
              attributes: @attributes
            ).call.reference_ids
          end

          def create
            graph = @references.map do |reference|
              next if reference.list?
              column = Column.factory(reference)
              [column.to_foreign_key, @reference_ids[reference.name]]
            end.compact.to_h

            @id = DB[@table.name.to_sym].insert(@attributes.merge(graph))
          end

          def add_to_join_tables
            AddToJoinTables.new(
              head: @head,
              id: @id,
              reference_ids: @reference_ids
            ).call
          end
        end
      end
    end
  end
end

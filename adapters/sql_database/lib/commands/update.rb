require_relative 'update/update_values'
require_relative 'update/link_to_references'
require_relative 'update/create_new_value'
require_relative 'update/delete_references'

module HecksAdapters
  class SQLDatabase
    module Commands
      # Upate a resource
      class Update
        attr_reader :id

        def initialize(attributes:, head:, id:)
          @attributes = attributes.clone
          @references = head.references
          @head_table = Table.factory([head]).first
          @id = id
        end

        def call
          DB.transaction do
            update_references
            fetch_record
            update_record
          end
          self
        end

        private

        def update_references
          UpdateValues.new(@references, @attributes, @head_table, @id).call
        end

        def update_record
          @record.update(@attributes)
        end

        def fetch_record
          @record = DB[@head_table.name.to_sym].where(id: @id)
        end
      end
    end
  end
end

require_relative 'update/update_values'
require_relative 'update/link_to_references'
require_relative 'update/create_new_value'

module Hecks
  module Domain
    module Adapters
      module SQLDatabase
        module Commands
          class Update
            attr_reader :id
            def initialize(attributes:, domain_module:)
              @attributes = attributes.clone
              @domain_module = domain_module
              @reference_ids = {}
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
              UpdateValues.new(references, @attributes, head_table).call
            end

            def update_record
              @record.update(@attributes)
            end

            def fetch_record
              @record = head_dataset.where(id: @attributes.delete(:id))
            end

            def head
              @domain_module.head
            end

            def head_dataset
              @head_dataset ||= DB[head_table.name.to_sym]
            end

            def head_table
              @head_table ||= Table.factory([head]).first
            end

            def references
              @references ||= @domain_module.head.references
            end
          end
        end
      end
    end
  end
end

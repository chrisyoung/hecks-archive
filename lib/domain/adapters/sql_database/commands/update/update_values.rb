module Hecks
  module Domain
    module Adapters
      module SQLDatabase
        module Commands
          class UpdateValues
            def initialize(references, attributes, table)
              @references = references
              @attributes = attributes
              @reference_ids = {}
              @table = table
            end

            def call
              @references.each do |reference|
                create_new_value(reference)
                delete_old_references(reference)
                link_to_new_values(reference)
              end
            end

            private

            def table
              @table ||= Table.factory([head]).first
            end

            def create_new_value(reference)
              @reference_ids = CreateNewValue.new(
                reference: reference,
                attributes: @attributes,
                reference_ids: @reference_ids
              ).call.reference_ids
            end

            def delete_old_references(reference)
              where = {}
              where[@table.to_foreign_key] = @attributes[:id]

              if reference.list?
                DB[@table.link_table_name(reference)].where(where).delete
              end

              @attributes.delete(reference.name.to_sym)
            end

            def link_to_new_values(reference)
              LinkToReferences.new(
                reference: reference,
                table: @table,
                reference_ids: @reference_ids,
                attributes: @attributes
              ).call
            end
          end
        end
      end
    end
  end
end

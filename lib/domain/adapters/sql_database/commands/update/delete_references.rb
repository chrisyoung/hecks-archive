module Hecks
  module Domain
    module Adapters
      module SQLDatabase
        module Commands
          class Update
            class DeleteReferences
              attr_reader :attributes

              def initialize(table:, attributes:, reference:)
                @table = table
                @attributes = attributes
                @reference = reference
                @where_clause = {}
                @dataset = DB[@table.link_table_name(@reference)]
              end

              def call
                build_where_clause
                delete_references
                remove_references_from_attributes
                self
              end

              private

              def build_where_clause
                DB[@table.link_table_name(@reference)]
              end

              def remove_references_from_attributes
                @attributes.delete(@reference.name.to_sym)
              end

              def delete_references
                return unless @reference.list?
                @dataset.where(@where_clause).delete
              end
            end
          end
        end
      end
    end
  end
end

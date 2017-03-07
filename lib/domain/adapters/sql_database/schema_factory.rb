module Hecks
  module Domain
    module Adapters
      module SQLDatabase
        class SchemaFactory
          def initialize(domain_spec)
            @domain_spec = domain_spec
            @tables = Table.factory(domain_objects)
            @join_tables = []
          end

          def build
            @tables.each do |table|
              swap_domain_references(table)
              build_join_tables(table)
              remove_domain_columns(table)
            end

            Schema.new(@tables + @join_tables)
          end

          private

          def domain_objects
            @domain_spec.domain_modules.values.flat_map(&:objects)
          end

          def swap_domain_references(table)
            table.foreign_key_columns.each do |column|
              add_db_reference(column, table)
            end
          end

          def build_join_tables(table)
            table.join_table_columns.each do |column|
              @join_tables << JoinTable.new(table, column)
            end
          end

          def remove_domain_columns(table)
            (table.foreign_key_columns + table.join_table_columns).each do |column|
              table.columns = table.columns.select do |table_column|
                table_column != column
              end
            end
          end

          def add_db_reference(column, table)
            table.columns << foreign_key_column(column.referenced_object)
          end

          def foreign_key_column(column_name, is_list = false)
            Column.new(name: column_name + '_id', type: 'Integer', is_list: is_list)
          end
        end
      end
    end
  end
end

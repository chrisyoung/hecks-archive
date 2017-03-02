class GenerateDomainMigrations < Thor::Group
  class MigrationBuilder
    class TableFactory
      def initialize(domain_spec)
        @domain_spec = domain_spec
        @domain_objects = @domain_spec.domain_modules.values.flat_map(&:objects)
      end

      def call
        fetch_tables
        fetch_columns
        swap_domain_references
        @tables
      end

      private

      def swap_domain_references
        @columns.each do |column|
          fetch_table(column.table_name)
          add_db_reference(column)
          remove_domain_column(column)
        end
      end

      def fetch_columns
        @columns = @tables.flat_map do |table|
          columns(table).map do |column|
            column
          end
        end
      end

      def columns(table)
        table.columns.select(&:reference?)
      end

      def remove_domain_column(column)
        @table.columns = @table.columns.select do |table_column|
          table_column != column
        end
      end

      def add_db_reference(column)
        @table.columns = @table.columns + [
          column.copy(name: column.name + '_id', type: 'Integer')
        ]
      end

      def fetch_table(table_name)
        @table = @tables.select do |t|
          t.name == table_name
        end.first
      end

      def fetch_tables
        @tables ||= @domain_objects.map do |domain_object|
          Table.new(domain_object: domain_object)
        end
      end
    end
  end
end

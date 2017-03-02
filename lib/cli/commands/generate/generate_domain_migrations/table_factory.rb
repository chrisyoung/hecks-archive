class GenerateDomainMigrations < Thor::Group
  class MigrationBuilder
    class TableFactory
      attr_reader :tables

      def initialize(domain_spec)
        @domain_spec = domain_spec
        @domain_objects = @domain_spec.domain_modules.values.flat_map(&:objects)
      end

      def call
        fetch_tables
        fetch_columns
        @columns.each { |column| swap_domain_reference(column) }
        self
      end

      private

      def swap_domain_reference(column)
        fetch_table(column.table_name)
        add_db_reference(column)
        remove_domain_column(column)
      end

      def fetch_columns
        @columns = @tables.flat_map do |table|
          columns(table)
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
        @table.columns += [foreign_key(column)]
      end

      def foreign_key(column)
        column.copy(name: column.name + '_id', type: 'Integer')
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

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
        fetch_references
        fetch_lists
        @references.each { |column| swap_domain_reference(column) }
        @lists.each { |column| build_join_table(column) }
        self
      end

      private

      def swap_domain_reference(column)
        fetch_table(column.table_name)
        add_db_reference(column)
        remove_domain_column(column)
      end

      def build_join_table(column)
        fetch_table(column.table_name)
        t = Table.new(
          name: "#{column.table_name}_#{column.name}",
          columns: [
            Column.new(name: column.table_name + '_id', type: 'Integer'),
            Column.new(name: column.name + '_id', type: 'Integer')
          ]
        )
        @tables = @tables + [t]
        remove_domain_column(column)
      end

      def fetch_references
        @references = @tables.flat_map do |table|
          table.columns.select {|column| column.reference?}
        end
      end

      def fetch_lists
        @lists = @tables.flat_map do |table|
          table.columns.select {|column| column.list?}
        end
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
        column.copy(name: column.name + '_id', type: 'Integer', is_list: column.list?)
      end

      def fetch_table(table_name)
        @table = @tables.select do |t|
          t.name == table_name
        end.first
      end

      def fetch_tables
        @tables ||= @domain_objects.map do |domain_object|
          Table.new(name: domain_object.name, columns: domain_object.attributes.map{|attribute| Column.factory(attribute)})
        end
      end
    end
  end
end

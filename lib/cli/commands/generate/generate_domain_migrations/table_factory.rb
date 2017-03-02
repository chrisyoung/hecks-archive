class GenerateDomainMigrations < Thor::Group
  class MigrationBuilder
    class TableFactory
      def self.call(domain_spec)
        domain_objects = domain_spec.domain_modules.values.flat_map(&:objects)

        tables = domain_objects.map do |domain_object|
          Table.new(domain_object: domain_object)
        end

        tables.each do |table|
          table.columns.each do |column|
            if column.reference?
              table = tables.select do |t|
                t.name == column.table_name
              end.first

              next unless table

              table.columns = table.columns + [Column.new(
                name: column.name + '_id',
                type: 'Integer',
                table_name: column.table_name,
                referenced_object: column.referenced_object
              )]

              result = table.columns.select do |c|
                c != column
              end

              table.columns = result
            end
          end
        end

        tables
      end
    end
  end
end

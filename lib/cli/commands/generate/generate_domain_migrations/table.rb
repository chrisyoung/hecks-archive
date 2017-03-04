class GenerateDomainMigrations < Thor::Group
  class MigrationBuilder
    class Table
      attr_accessor :columns

      def self.factory(domain_objects)
        r = domain_objects.map do |domain_object|
          new(
            name: domain_object.name,
            columns: domain_object.attributes.map do |attribute|
              Column.factory(attribute)
            end
          )
        end
      end

      def initialize(name:, columns:)
        @name = name
        @columns = columns
      end

      def join_table_columns
        columns.select(&:list?)
      end

      def foreign_key_columns
        columns.select(&:reference?)
      end

      def name
        @name.pluralize.underscore
      end
    end
  end
end

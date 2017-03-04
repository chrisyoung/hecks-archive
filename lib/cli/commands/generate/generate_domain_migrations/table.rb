class GenerateDomainMigrations < Thor::Group
  class MigrationBuilder
    class Table
      def self.factory(domain_spec)
        TableFactory.new(domain_spec).build
      end

      attr_writer :columns

      def initialize(name:, columns:)
        @name = name
        @columns = columns
      end

      def name
        @name.pluralize.underscore
      end

      def columns
        @columns
      end
    end
  end
end

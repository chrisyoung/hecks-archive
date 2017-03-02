class GenerateDomainMigrations < Thor::Group
  class MigrationBuilder
    class Table
      def self.factory(domain_spec)
        TableFactory.new(domain_spec).call
      end

      attr_writer :columns

      def initialize(domain_object:)
        @domain_object = domain_object
      end

      def name
        @domain_object.name.pluralize.underscore
      end

      def columns
        @columns || @domain_object.attributes.map do |attribute|
          Column.factory(attribute)
        end
      end
    end
  end
end

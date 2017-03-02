class GenerateDomainMigrations < Thor::Group
  class MigrationBuilder
    class Column
      attr_reader :referenced_object
      TYPE_MAP = {
        'Currency' => "BigDecimal",
        'String'   => 'String',
        'Integer'  => 'Integer'
      }

      def initialize(name:, referenced_object: nil, table_name: nil, type:)
        @name = name
        @referenced_object = referenced_object
        @type = type
        @table_name = table_name
      end

      def self.factory(attribute)
        new(
          name: attribute.name,
          referenced_object: attribute.referenced_object,
          type: attribute.type,
          table_name: attribute.object_name
        )
      end

      def reference?
        !@referenced_object.nil?
      end

      def referenced_table
        @referenced_object.pluralize.underscore
      end

      def table_name
        @table_name.pluralize.underscore
      end

      def name
        @name
      end

      def ==(other)
        return false if name != other.name
        return false if referenced_table != other.referenced_table
        return false if table_name != other.table_name
        true
      end

      def type
        TYPE_MAP[@type] || @type
      end
    end
  end
end

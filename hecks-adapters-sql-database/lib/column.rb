module HecksAdapters
  class SQLDatabase
    class Column
      attr_reader :referenced_object
      TYPE_MAP = {
        'Currency' => "BigDecimal",
        'String'   => 'String',
        'Integer'  => 'Integer'
      }

      def initialize(name:, referenced_object: nil, table_name: nil, type:, is_list: false)
        @name = name
        @referenced_object = referenced_object
        @type = type
        @table_name = table_name
        @is_list = is_list
      end

      def self.factory(attribute)
        new(
          name: attribute.name,
          referenced_object: attribute.referenced_object,
          type: attribute.type,
          table_name: attribute.object_name,
          is_list: attribute.list?
        )
      end

      def to_foreign_key
        (type.downcase + '_id').to_sym
      end

      def to_table_name
        name.downcase.pluralize.to_sym
      end

      def list?
        @is_list
      end

      def reference?
        @referenced_object
      end

      def referenced_table
        return unless @referenced_object
        @referenced_object.pluralize.underscore
      end

      def name
        @name
      end

      def copy(new_attributes={})
        self.class.new(
          {
            name: self.name,
            referenced_object: self.referenced_object,
            type: self.type,
            is_list: self.list?
          }.merge(new_attributes)
        )
      end

      def ==(other)
        return false if name != other.name
        return false if referenced_table != other.referenced_table
        true
      end

      def type
        TYPE_MAP[@type] || @type
      end
    end
  end
end

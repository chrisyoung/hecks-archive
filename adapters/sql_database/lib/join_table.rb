module HecksAdapters
  class SQLDatabase
    # Represents a SQL Table with information about object references
    class JoinTable
      def initialize(table, column)
        @table = table
        @column = column
      end

      def name
        "#{@table.name}_#{@column.name}"
      end

      def columns
        [@table.name, @column.name].map do |name|
          Column.new(name: name.singularize + '_id', type: 'Integer')
        end
      end
    end
  end
end

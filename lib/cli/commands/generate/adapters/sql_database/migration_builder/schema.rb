require_relative 'schema/factory'
class GenerateDomainMigrations < Thor::Group
  class MigrationBuilder
    class Schema
      def self.factory(domain_spec)
        Factory.new(domain_spec).build
      end

      def initialize(tables)
        @tables = tables
      end

      def to_h
        tables.map { |table| [table.name.to_sym, table] }.to_h
      end

      def tables
        @tables
      end
    end
  end
end

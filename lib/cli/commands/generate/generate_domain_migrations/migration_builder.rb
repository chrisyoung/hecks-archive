require_relative 'table'
require_relative 'table_factory'
require_relative 'column'

class GenerateDomainMigrations < Thor::Group
  class MigrationBuilder
    def initialize(generator, specification)
      @generator = generator
      @domain_spec = specification
    end

    def call
      generate_migrations
      self
    end

    def table_name
      @table.name
    end

    def columns
      @table.columns
    end

    def tables
      Table.factory(domain_spec).tables
    end

    private

    attr_reader :domain_spec, :generator

    def file_name(index, object)
      "#{index}_create_#{table_name}.rb"
    end

    def generate_migrations
      tables.each.with_index(1) do |table, index|
        @table = table
        @generator.template(
          "migration.rb.tt",
          "db/migrations/" + file_name(index, table)
        )
      end
    end
  end
end

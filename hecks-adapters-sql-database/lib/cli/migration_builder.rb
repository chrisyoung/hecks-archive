module HecksAdapters
  class SQLDatabase
    module CLI
      class MigrationBuilder
        def initialize(generator, specification)
          @generator = generator
          @schema = HecksAdapters::SQLDatabase::Schema.factory(specification)
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
          @schema.tables
        end

        private

        attr_reader :generator

        def file_name(index, object)
          "#{index}_create_#{table_name}.rb"
        end

        def generate_migrations
          tables.each.with_index(1) do |table, index|
            @table = table
            @generator.template(
              "migration.rb.tt",
              "db/migrate/" + file_name(index, table)
            )
          end
        end
      end
    end
  end
end

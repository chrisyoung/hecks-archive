module Hecks
  module DomainAdapters
    module SQLDatabase
      module CLI
        class GenerateDomainMigrations < Thor::Group
          include Thor::Actions
          attr_writer :migration_builder

          def load_domain_spec
            load('../../Domain')
          end

          def self.source_root
            File.dirname(__FILE__) + '/templates/'
          end

          def create_migration_file
            @migration_builder = MigrationBuilder.new(self, DOMAIN)
            @migration_builder.call
          end

          private

          def migration_builder
            @migration_builder
          end
        end
      end
    end
  end
end

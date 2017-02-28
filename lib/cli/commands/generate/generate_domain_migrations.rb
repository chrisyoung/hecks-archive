puts(`pwd`)
# load('../../Hecks')
require_relative 'generate_domain_migrations/migration_builder'

class GenerateDomainMigrations < Thor::Group
  include Thor::Actions
  attr_writer :migration_builder

  def self.source_root
    File.dirname(__FILE__) + '/templates/sql_database/'
  end

  def create_migration_file
    @migration_builder = MigrationBuilder.new(self)
    @migration_builder.call
  end

  private

  def migration_builder
    @migration_builder
  end
end

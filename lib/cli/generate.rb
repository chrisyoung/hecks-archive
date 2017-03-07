# frozen_string_literal: true
class Generate < Thor
  desc          'domain_objects', 'generate domain objects'
  method_option :type,
                aliases:  '-t',
                required: true,
                desc:     'The type of the domain object you want to generate',
                banner:   '[OBJECT_TYPE]',
                enum:     %w(entity value_object aggregate reference) if File.file?('Domain') || File.file?('hecks.gemspec')

  register(Hecks::Domain::CLI::GenerateDomainObject,
                'domain_object',
                'domain_object',
                'Generate Domain Objects') if File.file?('Domain')

  desc           'resource_server', 'generate resource_server adapter'
  register(Hecks::Domain::Adapters::ResourceServer::CLI::GenerateResourceServer,
                 'resource_server',
                 'resource_server',
                 'Generate A Resource Server for a domain') if File.file?('Domain')

  desc           'sql_database', 'generate SQL database adapter'
  register(Hecks::Domain::Adapters::SQLDatabase::CLI::GenerateSQLDatabase,
                 'sql_database',
                 'sql_database',
                 'Generate a SQL Server Database adapter') if File.file?('Domain')

  desc           'domain_migrations', 'generate migrations for the sql database adapter based on your domain'
  register(Hecks::Domain::Adapters::SQLDatabase::CLI::GenerateDomainMigrations,
                 'domain_migrations',
                 'domain_migrations',
                 'Generate Domain Migrations')

  desc           'readme', 'Generate the hecks Readme with the latest examples'
end

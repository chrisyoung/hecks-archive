# frozen_string_literal: true
require_relative 'generate/new'
require_relative 'generate/generate_domain_object'
require_relative 'generate/generate_resource_server'
require_relative 'generate/generate_sql_database'
require_relative 'generate/generate_domain_migrations'
require_relative 'generate/builder'


class Generate < Thor
  desc          'domain_objects', 'generate domain objects'
  method_option :type,
                aliases:  '-t',
                required: true,
                desc:     'The type of the domain object you want to generate',
                banner:   '[OBJECT_TYPE]',
                enum:     %w(entity value_object aggregate reference) if File.file?('HECKS') || File.file?('hecks.gemspec')

  register(GenerateDomainObject,
                'domain_object',
                'domain_object',
                'Generate Domain Objects') if File.file?('HECKS')

  desc           'resource_server', 'generate resource_server adapter'
  register(GenerateResourceServer,
                 'resource_server',
                 'resource_server',
                 'Generate A Resource Server for a domain') if File.file?('HECKS')

  desc           'sql_database', 'generate SQL database adapter'
  register(GenerateSQLDatabase,
                 'sql_database',
                 'sql_database',
                 'Generate a SQL Server Database adapter') if File.file?('HECKS')

  desc           'domain_migrations', 'generate migrations for the sql database adapter based on your domain'
  register(GenerateDomainMigrations,
                 'domain_migrations',
                 'domain_migrations',
                 'Generate Domain Migrations')

end

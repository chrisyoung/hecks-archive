@version = File.read('version').gsub("\n", '')
@root = Dir.pwd

MAPPINGS=[
  { path: 'domain', gem: 'hecks-domain' },
  { path: 'adapters/memory_database', gem: 'hecks-memory-database' },
  { path: 'application', gem: 'hecks-application' },
  { path: 'adapters/sql_database', gem: 'hecks-adapters-sql-database' },
  { path: 'adapters/dynamodb', gem: 'hecks-adapters-dynamodb' },
  { path: 'adapters/resource_server', gem: 'hecks-adapters-resource-server' },
  { path: 'adapters/rails', gem: 'hecks-adapters-rails' },
  { path: 'plugins/json_validator', gem: 'hecks-plugins-json-validator' },
  { path: 'example/pizza_builder', gem: 'pizza_builder' },
  { path: nil, gem: 'hecks' }
]

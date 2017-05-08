ENV['DATABASE_URL'] ||= 'mysql2://root:password@localhost/pizza_builder_test'
ENV['HECKS_ENVIRONMENT'] ||= 'test'
ENV['HECKS_DOMAIN_PATH'] ||= File.dirname(__FILE__) + '/../example/pizza_builder/Domain'

require_relative '../domain/lib/hecks-domain'
require_relative '../adapters/dynamodb/lib/hecks-adapters-dynamodb'
require_relative '../adapters/memory_database/lib/hecks-memory-database'
require_relative '../adapters/resource_server/lib/hecks-adapters-resource-server'
require_relative '../adapters/sql_database/lib/hecks-adapters-sql-database'
require_relative '../lib/hecks'
require_relative '../example/pizza_builder/lib/pizza_builder'

PIZZA_ATTRIBUTES = {
  name:        'White Pizza',
  description: 'white sauce and chicken',
  chef:        { name:  'Chef Ramsey' },
  toppings:    [{ name: 'Chicken' }, {name: 'Cheese'}] }

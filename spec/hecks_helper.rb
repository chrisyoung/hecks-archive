ENV['DATABASE_URL'] ||= 'mysql2://root:password@localhost/pizza_builder_test'
ENV['HECKS_PATH'] = File.dirname(__FILE__) + '/../hecks/lib/hecks'

# binding.pry
require_relative '../hecks/lib/hecks'
require_relative '../hecks-examples/pizza_builder/lib/pizza_builder'
# require_relative '../hecks-domain/lib/hecks-domain'
# require_relative '../hecks-adapters/lib/hecks-adapters'
# require_relative '../hecks-adapters/hecks-adapters-resource-server/lib/hecks-adapters-resource-server'
# require_relative '../hecks-adapters/hecks-adapters-sql-database/lib/hecks-adapters-sql-database'

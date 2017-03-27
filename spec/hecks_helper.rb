ENV['DATABASE_URL'] ||= 'mysql2://root:password@localhost/pizza_builder_test'

require_relative '../hecks/lib/hecks'
require_relative '../hecks-examples/pizza_builder/lib/pizza_builder'

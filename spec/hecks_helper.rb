ENV['DATABASE_URL'] ||= 'mysql2://root:password@localhost/pizza_builder_test'
ENV['HECKS_ENVIRONMENT'] ||= 'test'

require_relative '../hecks/lib/hecks'
require_relative '../hecks-application/lib/hecks-application'
require_relative '../hecks-adapters-dynamodb/lib/hecks-adapters-dynamodb'
require_relative '../hecks-examples/pizza_builder/lib/pizza_builder'

PIZZA_ATTRIBUTES =
{
  name: 'White Pizza',
  description: 'white sauce and chicken',
  chef: {name: "Chef Ramsey"},
  toppings: [{ name: 'chicken' }]
}

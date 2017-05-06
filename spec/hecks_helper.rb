ENV['DATABASE_URL'] ||= 'mysql2://root:password@localhost/pizza_builder_test'
ENV['HECKS_ENVIRONMENT'] ||= 'test'

require_relative '../domain/lib/hecks-domain'
require_relative '../lib/hecks'
require_relative '../example/pizza_builder/lib/pizza_builder'

PIZZA_ATTRIBUTES =
{
  name: 'White Pizza',
  description: 'white sauce and chicken',
  chef:        { name: "Chef Ramsey" },
  toppings:    [{ name: 'chicken' }]
}

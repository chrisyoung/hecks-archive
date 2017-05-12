ENV['DATABASE_URL']      ||= 'mysql2://root:password@localhost/pizza_builder_test'
ENV['HECKS_ENVIRONMENT'] ||= 'test'
ENV['HECKS_DOMAIN_PATH'] ||= File.dirname(__FILE__) + '/../example/pizza_builder/Domain'

# Adding these folders to the load path allows specs to be run
# with no gems installed, ie. require hecks-application
%w{ /../adapters/dynamodb/lib/
    /../adapters/resource_server/lib/
    /../adapters/memory_database/lib/
    /../adapters/sql_database/lib/
    /../application/lib/
    /../domain/lib/
  }.each do |file|
    $LOAD_PATH.unshift(File.dirname(__FILE__) + file)
  end

require_relative '../lib/hecks'
require_relative '../example/pizza_builder/lib/pizza_builder'

# Easy way to grab a valid pizza when playing with apis
PIZZA_ATTRIBUTES = {
  name:        'White Pizza',
  description: 'white sauce and chicken',
  chef:        { name:  'Chef Ramsey' },
  toppings:    [{ name: 'Chicken' }, { name: 'Cheese' }] }

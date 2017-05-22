ENV['DATABASE_URL']      ||= 'mysql2://root:password@localhost/pizza_builder_test'
ENV['HECKS_ENVIRONMENT'] ||= 'test'
ENV['HECKS_DOMAIN_PATH'] ||= File.dirname(__FILE__) + '/../example/pizza_builder/Domain'

require_relative 'load_path'

require_relative '../lib/hecks'
require_relative '../example/pizza_builder/lib/pizza_builder'

# Easy way to grab a valid pizza when playing with apis
PIZZA_ATTRIBUTES = {
  name:        'White Pizza',
  description: 'white sauce and chicken',
  chef:        { name:  'Chef Ramsey' },
  toppings:    [{ name: 'Chicken' }, { name: 'Cheese' }] }

ORDER_ATTRIBUTES = {
  line_items: [{
    pizza_name: "White Pizza",
    quantity: 1,
    price: 5.0
  }]}

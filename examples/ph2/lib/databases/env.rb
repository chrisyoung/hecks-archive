require 'active_record'
require 'mysql2'
require_relative 'active_record/repositories/pizzas'

::ActiveRecord::Base.establish_connection(
  adapter: 'mysql2',
  host: 'localhost',
  database: 'pizzas_dev'
)

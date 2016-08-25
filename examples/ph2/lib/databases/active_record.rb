require 'active_record'
require_relative 'active_record/repositories/pizzas'

::ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: 'pizzas_repository.db'
)

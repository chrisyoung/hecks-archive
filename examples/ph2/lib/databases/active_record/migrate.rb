require_relative 'active_record.rb'
require_relative 'migrations/create_pizzas'

CreatePizza.migrate(:up)

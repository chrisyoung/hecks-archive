require 'active_record'
require_relative 'active_record/repositories/pizzas'

::ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: 'pizzas_repository.db'
)

module Databases
  class ActiveRecord
    def initialize(repositories: {pizzas: Domain::Pizzas::Repository})
      @repositories = repositories
    end

    def [] (module_name)
      @repositories[module_name]
    end

    def delete_all
      @repositories.values.each do |repository|
        repository.delete_all
      end
    end
  end
end

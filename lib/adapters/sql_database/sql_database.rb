require_relative 'column'
require_relative 'join_table'
require_relative 'schema_factory'
require_relative 'schema'
require_relative 'table'
require_relative 'repository'
require 'sequel'
require_relative 'commands/commands'

if ENV["DATABASE_URL"]
  DB = Sequel.connect(ENV["DATABASE_URL"])
end

module Hecks
  module Adapters
    class SQLDatabase
      def initialize(domain:)
        @domain = domain
      end

      def [](module_name)
        Repository.new(module_name: module_name)
      end
    end
  end
end

require_relative 'schema_factory'
require_relative 'table'
require_relative 'join_table'
require_relative 'column'

module Hecks
  module Domain
    module Adapters
      module SQLDatabase
        class Schema
          attr_reader :tables
          def self.factory(domain_spec)
            SchemaFactory.new(domain_spec).build
          end

          def initialize(tables)
            @tables = tables
          end

          def to_h
            tables.map { |table| [table.name.to_sym, table] }.to_h
          end
        end
      end
    end
  end
end

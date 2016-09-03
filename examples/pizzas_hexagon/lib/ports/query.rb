module PizzasHexagon
  module Ports
    class Query
      def initialize(query_name:, module_name:, args:, database: Adapters::Databases::Memory.new)
        @database    = database
        @module_name = module_name
        @args        = args
        @query_name  = query_name
      end

      def call()
        database[module_name].query args
      end

      private

      attr_reader :database, :module_name, :args, :query_name
    end
  end
end

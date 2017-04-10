module Hecks
  class Application
    class QueryRunner
      def initialize(query_name:, application:, module_name:, args:)
        @query_name = query_name
        @application = application
        @module_name = module_name
        @args = args
      end

      def call()
        fetch.new(repository: repository).call(@args)
      end

      private

      def fetch
        Queries.const_get(@query_name.to_s.camelcase)
      end

      def repository
        @application.database[@module_name]
      end
    end
  end
end

module HecksAdapters
  class DynamoDB
    # Drop all tables!
    class DropAll
      def initialize(client:, domain:)
        @client = client
        @domain = domain
        load(domain.spec_path)
      end

      def call
        list_tables
        drop_tables
        self
      end

      def result
        { tables: @tables }
      end

      private

      attr_reader :tables, :client

      def list_tables
        @tables = client.list_tables.table_names
      end

      def drop_tables
        @tables.each do |table|
          client.delete_table({table_name: table})
        end
      end
    end
  end
end

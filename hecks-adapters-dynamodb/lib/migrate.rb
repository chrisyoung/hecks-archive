module HecksAdapters
  class DynamoDB
    class Migrate
      def initialize(client:, domain:)
        @client           = client
        @unchanged_tables = []
        @new_tables       = []
        @domain           = domain
        load(@domain.spec_path)
      end

      def call
        create_tables
        self
      end

      def result
        { unchanged_tables: @unchanged_tables, new_tables: @new_tables }
      end

      private

      attr_reader :client

      def create_tables
        DOMAIN.domain_modules.values.each do |domain_module|
          create_table(domain_module.head.name)
        end
      end

      def create_table(name)
        begin
          client.create_table(
            attribute_definitions: [{
              attribute_name: 'id',
              attribute_type: 'S'
            }],
            table_name: name,
            key_schema: [{ attribute_name: 'id', key_type: 'HASH' }],
            provisioned_throughput: {
              read_capacity_units: 5,
              write_capacity_units: 5
            }
          )
          @new_tables << name
        rescue Aws::DynamoDB::Errors::ResourceInUseException => e
          @unchanged_tables << name
        end
      end
    end
  end
end

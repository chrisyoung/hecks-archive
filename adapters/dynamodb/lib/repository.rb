require_relative 'commands/create'
require_relative 'commands/read'
require_relative 'commands/update'
require_relative 'commands/delete'

module HecksAdapters
  class DynamoDB
    # Use the Aws::DynamoDB::Client to persist your domain resources
    class Repository
      attr_reader :id

      def initialize(head)
        @head = head
        @client = Aws::DynamoDB::Client.new(region: 'us-east-1')
      end

      def create(args)
        Commands::Create.new(args, head, client).call
      end

      def delete(id)
        Commands::Delete.new({id: id}, head, client).call
      end

      def read(id)
        Commands::Read.new(id, head, client).call
      end

      def update(id, attributes)
        Commands::Update.new(id, attributes, head, client).call
      end

      private

      attr_reader :head, :client
    end
  end
end

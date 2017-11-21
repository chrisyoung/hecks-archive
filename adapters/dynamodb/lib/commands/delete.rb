module HecksAdapters
  class DynamoDB
    module Commands
      # Delete a resource on Dynamo DB
      class Delete
        def initialize(query, head, client)
          @head = head
          @query = query
          @client = client
        end

        def call
          delete_item
          self
        end

        private

        attr_reader :client, :head, :query

        def delete_item
          query_with_type = {}
          query_with_type[query.keys.first] = {s: query[query.keys.first]}
          puts 'deleting item'
          client.delete_item(key: query_with_type, table_name: head.name)
        end
      end
    end
  end
end

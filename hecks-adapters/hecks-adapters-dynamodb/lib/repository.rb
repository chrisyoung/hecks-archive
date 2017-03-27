require_relative 'commands/create'
require_relative 'commands/read'
require_relative 'commands/update'
require_relative 'commands/delete'

module Hecks
  module Adapters
    class DynamoDB
      class Repository
        attr_reader :id

        def create(args)
          Commands::Create.new(args).call
        end

        def delete(id)
          Commands::Delete.new(id).call
        end

        def read(id)
          Commands::Read.new(id).call
        end

        def update(id, attributes)
          Commands::Update.new(id, attributes).call
        end
      end
    end
  end
end

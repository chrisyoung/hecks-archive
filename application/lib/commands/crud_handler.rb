class HecksApplication
  module Commands
    # Map resourceful methods to the domain
    class CRUDHandler
      attr_reader :module_name, :application, :validator

      def initialize(module_name:, application:, validator:)
        @module_name = module_name
        @application = application
        @validator = validator
      end

      def create(args)
        application.call(
          module_name:  module_name,
          command_name: :create,
          args:         args
        )
      end

      def read(id)
        application.query(
          module_name: module_name,
          query_name: :find_by_id,
          args:       { id: id }
        )
      end

      def update(attributes)
        application.call(
          module_name:  module_name,
          command_name: :update,
          args:         attributes
        )
      end

      def delete(id)
        application.call(
          module_name:  module_name,
          command_name: :delete,
          args:         { id: id }
        )
      end
    end
  end
end

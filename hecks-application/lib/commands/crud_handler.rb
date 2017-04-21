class HecksApplication
  module Commands
    class CRUDHandler
      attr_reader :module_name, :application

      def initialize(module_name:, application:)
        @module_name = module_name
        @application = application
      end

      def create(attributes)
        application.call(
          module_name: module_name,
          command_name: :create,
          args: attributes
        )
      end

      def read(id)
        application.query(
          module_name: module_name,
          query_name: :find_by_id,
          args: { id: id }
        )
      end

      def update(id, attributes)
        application.call(
          module_name: module_name,
          command_name: :update,
          args: attributes.merge(id: id)
        )
      end

      def delete(id)
        application.call(
          module_name: module_name,
          command_name: :delete,
          args: { id: id }
        )
      end
    end
  end
end

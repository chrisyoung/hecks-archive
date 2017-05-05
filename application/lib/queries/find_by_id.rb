# frozen_string_literal: true
class HecksApplication
  module Queries
    # Find a resource by id
    class FindById
      def initialize(repository:)
        @repository = repository
      end

      def call(params)
        return unless params.keys == [:id]
        @repository.read(params[:id])
      end
    end
  end
end

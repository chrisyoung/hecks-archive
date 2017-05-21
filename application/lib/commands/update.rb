# frozen_string_literal: true
class HecksApplication
  module Commands
    # Update a resource
    class Update
      attr_accessor :args, :repository

      def initialize(args: nil, repository: Repository, domain_module:, id: id)
        @repository      = repository
        @args            = args
        @errors          = []
        @id              = @args.delete(:id)
      end

      def name
        self.class.to_s.split('::').last.underscore
      end

      def call
        update
        self
      end

      def result
        { success: errors.empty?, errors: errors, args: args }
      end

      def to_h
        { id: id, args: args }
      end

      private

      attr_reader :repository_result, :id, :errors

      def update
        return if @errors.count.positive?
        @repository_result = repository.update(id, args)
      end
    end
  end
end

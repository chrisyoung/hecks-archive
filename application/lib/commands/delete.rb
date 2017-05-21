# frozen_string_literal: true
class HecksApplication
  module Commands
    # Delete a resource.
    class Delete
      attr_accessor :args, :errors, :repository

      def initialize(args: nil, repository:, domain_module:, id: )
        @args            = args || chained_command.args
        @repository      = repository
        @errors          = { base: [] }
        @id = id
      end

      def call
        delete
        self
      end

      def name
        self.class.to_s.split('::').last.underscore
      end

      def to_h
        { errors: errors, args: args }
      end

      def result
        { id: args[:id], errors: errors, args: args }
      end

      private

      attr_accessor :command_result, :repository

      def delete
        @result = repository.delete(args[:id])
        @errors[:base] << "cound not find #{args[:id]}" unless @result
      end
    end
  end
end

# frozen_string_literal: true
class HecksApplication
  module Commands
    # Create a resource
    class Create
      attr_accessor :args, :result, :errors, :repository, :domain_module, :id

      def initialize(args:, repository:, domain_module:, validator: nil)
        @repository      = repository
        @args            = args
        @errors          = {}
        @validator       = validator
        @domain_module   = domain_module
      end

      def call
        validate
        create
        self
      end

      def to_h
        { errors: errors, id: repository_result, args: args }
      end

      def name
        self.class.to_s.split('::').last.underscore
      end

      def result
        { id: id, success: !id.nil?, errors: errors, args: args }
      end

      private

      attr_reader :repository_result

      def create
        return if @errors.count.positive?
        @id = args[:id]
        repository.create(args)
      end

      def validate
        return if @validator.nil?
        @errors = @validator.new(command: self).call.errors
      end
    end
  end
end

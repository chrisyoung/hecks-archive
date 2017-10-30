# frozen_string_literal: true
class HecksApplication
  module Commands
    # Create a resource
    class Create
      attr_accessor :args, :result, :errors, :repository, :domain_module

      def initialize(args:, repository:, domain_module:, validator: HecksApplication::Validator)
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

      attr_reader :repository_result, :id

      def create
        return if @errors.count.positive?
        @id = @repository_result = repository.create(args).id
      end

      def validate
        return if @validator.nil?
        @errors = @validator.new(command: self).call.errors
      end
    end
  end
end

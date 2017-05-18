# frozen_string_literal: true
class HecksApplication
  module Commands
    # Create a resource
    class Create
      attr_accessor :args, :result, :errors, :repository, :domain_module

      def initialize(args:, repository:, domain_module:, id:)
        @repository      = repository
        @args            = args
        @errors          = {}
        @validator       = HecksAdapters::Validator
        @domain_module   = domain_module
        @id              = id
      end

      def call
        validate
        create
        self
      end

      def to_h
        { errors: errors, id: id, args: args }
      end

      def name
        self.class.to_s.split('::').last.underscore
      end

      def result
        {
          id: id,
          success: !id.nil?,
          errors:  errors,
          args:    args
        }
      end

      # This represents what the object will look like when it is persisted,
      # making it easy for the client to contintue easily with operations,
      # blissfully unaware that the operations are being committed from a
      # command bus.
      def head
        args.merge(id: id)
      end

      private

      attr_reader :id

      def create
        return if @errors.count.positive?
        repository.create(id, args)
      end

      def validate
        return if @validator.nil?
        @errors = @validator.new(command: self).call.errors
      end
    end
  end
end

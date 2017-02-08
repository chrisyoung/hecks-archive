module Hecks
  module Adapters
    class Validator
      attr_reader :errors

      def initialize(args:, head_spec:)
        @args = args
        @head_spec = head_spec
        @errors = {}
      end

      def call
        validate
        return self
      end

      private

      attr_reader :args, :head_spec

      def validate
        (missing_attributes).each do |missing_attribute|
          errors[missing_attribute] = []
          errors[missing_attribute] << "missing"
        end
      end

      def missing_attributes
        head_spec.attribute_hash.keys - args.keys
      end
    end
  end
end

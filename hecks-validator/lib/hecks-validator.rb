module HecksAdapters
  class Validator
    attr_reader :errors

    def initialize(command:)
      @args = command.args
      @head_spec = command.domain_module.head
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

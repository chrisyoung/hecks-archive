require 'json-schema'
require_relative 'schema_parser'

module HecksPlugins
  class JSONValidator
    attr_reader :errors

    def initialize(command:)
      @args       = command.args
      @head_spec  = command.domain_module.head
      @errors     = {}
      @parser     = SchemaParser.new(head_spec: head_spec).call
      @validator  = JSON::Validator
    end

    def call
      parse_schema
      validate
      self
    end

    private

    attr_reader :args, :head_spec, :schema, :parser, :validator

    def parse_schema
      @schema = parser.schema
    end

    def validate
      MATCHERS.each do |matcher|
        validator.fully_validate(schema, args).each do |error|
          field_name = error.match(matcher[:regex])[1].to_sym
          errors[field_name] ||= []
          errors[field_name] << matcher[:message]
        end
      end
    end
  end
end

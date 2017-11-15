require 'json-schema'
require_relative 'matchers'
require_relative 'parsers/schema_parser'
require_relative 'parsers/message_parser'


module HecksPlugins
  class JSONValidator
    attr_reader :errors

    def initialize(command:)
      @args          = command.args
      @head_spec     = command.domain_module.head
      @errors        = {}
      @schema_parser = SchemaParser.new(head_spec: head_spec).call
      @validator     = JSON::Validator
    end

    def call
      parse_schema
      validate
      self
    end

    private

    attr_reader :args, :head_spec, :schema, :schema_parser, :validator

    def parse_schema
      @schema = schema_parser.schema
    end

    def validate
      MATCHERS.each do |matcher|
        validator.fully_validate(schema, args).each do |error|
          parser = MessageParser.new(matcher: matcher, error: error).call
          next unless parser.message
          errors[parser.field_name] ||= []
          errors[parser.field_name] << parser.message
        end
      end
    end
  end
end

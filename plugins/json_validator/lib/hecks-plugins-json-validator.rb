require 'json-schema'
require_relative 'matchers'
require_relative 'parsers/schema_parser'
require_relative 'parsers/message_parser'

module HecksPlugins
  # A validator that is built on top of json-schema to provide more
  # functionality than the basic hecks validator.  Builds a json schema
  # from a head spec and validates the user's input against it.
  class JSONValidator
    attr_reader :errors

    def initialize(command:)
      @args          = command.args
      @domain_module = command.domain_module
      @errors        = {}
      @schema_parser = SchemaParser.new(
        domain_module: domain_module,
        object:        command.domain_module.head
      ).call

      @validator     = JSON::Validator
    end

    def call
      parse_schema
      validate
      self
    end

    private

    attr_reader :args, :domain_module, :schema, :schema_parser, :validator

    def parse_schema
      @schema = schema_parser.schema
    end

    def validate
      MATCHERS.each do |matcher|
        result = validator.fully_validate(schema, args, errors_as_objects: true)

        result.each do |error|
          parser = MessageParser.new(matcher: matcher, error: error).call
          next unless parser.message
          set_errors(parser)
        end
      end
    end

    def set_errors(parser)
      if parser.fragment && parser.fragment != parser.field_name
        errors[parser.fragment] ||= {}
        errors[parser.fragment][parser.field_name] ||= []
        errors[parser.fragment][parser.field_name] << parser.message
      else
        errors[parser.field_name] ||= []
        errors[parser.field_name] << parser.message
      end
    end
  end
end

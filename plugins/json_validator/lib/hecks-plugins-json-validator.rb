require 'json-schema'

module HecksPlugins
  class JSONValidator
    attr_reader :errors

    MATCHERS = [
      {
        regex: /did not contain a required property of '(.*)'/,
        message: 'missing'
      }
    ]

    def initialize(command:)
      @args = command.args
      @head_spec = command.domain_module.head
      @errors = {}
      @properties = {}
    end

    def call
      parse_properties
      parse_required_fields
      parse_schema
      validate
      self
    end

    private

    attr_reader :args, :head_spec, :properties, :schema, :required_fields

    def parse_required_fields
      @required_fields = head_spec.attributes.map{ |a| a.name }
    end

    def parse_properties
      head_spec.attributes.each do |a|
        properties[a.name] = {"type" => a.type.downcase}
      end
    end

    def parse_schema
      @schema = {
        "type" => "object",
        "required" => required_fields,
        "properties" => @properties
      }
    end

    def validate
      MATCHERS.each do |matcher|
        JSON::Validator.fully_validate(schema, args).each { |error|
          field_name = error.match(matcher[:regex])[1].to_sym
          @errors[field_name] ||= []
          @errors[field_name] << matcher[:message]
        }
      end
    end
  end
end

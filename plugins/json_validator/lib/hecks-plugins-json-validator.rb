require 'json-schema'

module HecksPlugins
  class JSONValidator
    attr_reader :errors

    MATCHERS=[{
      regex: /did not contain a required property of '(.*)'/,
      message: 'missing'
    }]

    def initialize(command:)
      @args = command.args
      @head_spec = command.domain_module.head
      @errors = {}
      validate
    end

    def call
      self
    end

    private

    attr_reader :args, :head_spec

    def schema
      {
        "type" => "object",
        "required" => ["description", "chef"],
        "properties" => {
          "description" => {"type" => "string"},
          "chef" => {"type" => "object"}
        }
      }
    end

    def validate
      MATCHERS.each do |matcher|
        JSON::Validator.fully_validate(schema, args).each { |error|
          @errors[error.match(matcher[:regex])[1].to_sym] ||= []
          @errors[error.match(matcher[:regex])[1].to_sym] << matcher[:message]
        }
      end
    end
  end
end

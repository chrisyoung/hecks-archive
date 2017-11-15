require 'json-schema'

module HecksPlugins
  class JSONValidator
    attr_reader :errors

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

    def validate
    end
  end
end

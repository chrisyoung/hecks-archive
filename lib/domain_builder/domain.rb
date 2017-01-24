# frozen_string_literal: true
class Domain
  attr_reader :modules, :value_objects, :module_services

  def initialize(schema: nil, builder: nil)
    @schema = schema
    @builder = builder
    build_from_schema if schema
    build_from_builder if builder
  end

  private

  attr_accessor :schema

  def build_from_schema
    @modules = schema[:modules].map do |domain_module|
      DomainModule.new(domain_module)
    end

    @value_objects = @modules.map(&:value_objects).flatten
  end

  def build_from_builder
    @modules = @builder.domain_modules.map do |domain_module|
      DomainModule.new(domain_module)
    end

    @value_objects = @modules.map(&:value_objects).flatten
  end
end

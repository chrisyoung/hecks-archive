# frozen_string_literal: true
class Domain
  attr_reader :modules, :value_objects, :module_services
  def initialize(schema)
    @modules = schema[:modules].map do |domain_module|
      DomainModule.new(domain_module)
    end

    @value_objects = @modules.map(&:value_objects).flatten
  end
end

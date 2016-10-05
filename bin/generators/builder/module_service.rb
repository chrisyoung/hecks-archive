# frozen_string_literal: true
class ModuleService
  attr_reader :name, :domain_module
  def initialize(service, domain_module)
    @name = service[:name]
    @attributes = service[:attributes]
    @domain_module = domain_module
  end

  def attributes
    @attributes.map do |key, value|
      "#{key}:#{value}"
    end.join(' ')
  end
end

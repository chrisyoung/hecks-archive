# frozen_string_literal: true
class DomainObject
  attr_reader :name, :module_name

  def initialize(object, module_name)
    @name        = object.name
    @head        = object.is_a?(Hecks::DomainBuilder::Head)
    @module_name = module_name
    @fields      = object.attributes
  end

  def fields
    @fields.map do |attributes|
      Field.new(attributes)
    end.map(&:to_s).join(' ')
  end

  def head?
    !@head.nil?
  end
end

# frozen_string_literal: true
class DomainObject
  attr_reader :name, :module_name

  def initialize(attributes)
    @name        = attributes[:name]
    @head        = attributes[:head]
    @module_name = attributes[:module_name]
    @fields      = attributes[:attributes]
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

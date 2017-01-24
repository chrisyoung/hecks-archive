# frozen_string_literal: true
class Field
  attr_reader :name, :type

  def initialize(attributes)
    attributes = attributes.split("=")
    @name = attributes.first
    @type = attributes.last
  end

  def to_s
    "#{name}:#{type}"
  end
end

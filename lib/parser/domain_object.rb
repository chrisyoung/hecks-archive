class DomainObject
  attr_reader :name

  def initialize(attributes)
    @name   = attributes[:name]
    @head   = attributes[:head]
    @fields = attributes[:attributes]
  end

  def fields
    @fields.map do |attributes|
      Field.new(attributes)
    end.map(&:to_s).join(" ")
  end

  def head?
    !@head.nil?
  end
end

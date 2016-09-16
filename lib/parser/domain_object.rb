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
    end
  end

  def head?
    !@head.nil?
  end
end

class Field
  attr_reader :name, :type

  def initialize(attributes)
    @name = attributes.first
    @type = attributes.last
  end
end

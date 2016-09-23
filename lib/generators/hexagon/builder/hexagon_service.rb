class HexagonService
  attr_reader :name, :attributes
  def initialize(service)
    @name = service[:name]
    @attributes = service[:attributes]
  end

  def attributes
    @attributes.map do |key, value|
      "#{key}:#{value}"
    end.join(' ')
  end
end

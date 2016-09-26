class HexagonService
  attr_reader :name, :attributes
  def initialize(service)
    @name = service[:name]
    @attributes = service[:attributes]
  end

  def attributes
    @attributes.map { |key, value| "#{key}:#{value}"}.join(' ')
  end
end

class Hexagon
  attr_reader :modules, :name

  def initialize(hexagon)
    @name = hexagon[:name]
    @modules = hexagon[:modules].map do |attributes|
      DomainModule.new(attributes)
    end
  end
end

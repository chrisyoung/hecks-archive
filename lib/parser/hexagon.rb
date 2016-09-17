class Hexagon
  attr_reader :modules, :name, :services

  def initialize(hexagon)
    @services = hexagon[:services]
    @name     = hexagon[:name]
    @modules  = hexagon[:modules].map do |attributes|
      DomainModule.new(attributes)
    end
  end
end

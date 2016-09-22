class Hexagon
  attr_reader :modules, :name, :services

  def initialize(hexagon)
    @services = hexagon[:services]
    @name     = hexagon[:name]
    @modules  = hexagon[:modules].map do |attributes|
      DomainModule.new(attributes)
    end
  end

  def value_objects
    modules.flat_map do |domain_module|
      domain_module.value_objects
    end
  end

  def module_services
    modules.flat_map do |domain_module|
      domain_module.services
    end
  end
end

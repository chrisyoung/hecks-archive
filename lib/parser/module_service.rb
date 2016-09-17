class ModuleService
  attr_reader :name, :domain_module
  def initialize(name, domain_module)
    @name = name
    @domain_module = domain_module
  end
end

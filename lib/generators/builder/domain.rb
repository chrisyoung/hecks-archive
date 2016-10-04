class Domain
  attr_reader :modules, :value_objects, :module_services
  def initialize(schema)
    @modules = schema[:modules].map do |domain_module|
      DomainModule.new(domain_module)
    end

    @value_objects = @modules.map do |domain_module|
      domain_module.value_objects
    end.flatten

    @module_services = @modules.map do |domain_module|
      domain_module.services.each do |service|
        service
      end
    end.flatten
  end


end

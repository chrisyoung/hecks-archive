module PizzaServer
  Dir[File.dirname(__FILE__) + "/domain/**/*.rb"].each {|file| require file}

  def self.domain_modules
    Domain.constants.map { |name| Domain.const_get(name)}
  end

  def self.repositories
    domain_modules.map do |domain_module|
      [aggregate_name(domain_module), domain_module.const_get(:Repository)]
    end.to_h
  end

  def self.queries
    domain_modules.map do |domain_module|
      domain_module.const_get(:Queries).map do |query|
        binding.pry
      end
    end
  end

  def self.aggregate_name(domain_module)
    domain_module.to_s.downcase.split("::").last.to_sym
  end

  def self.schemas(module_name:, command:)
    Domain.const_get(module_name.to_s.camelcase)::Schemas.const_get(command.camelcase)
  end
end

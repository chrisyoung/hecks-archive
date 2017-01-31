module SoccerSeason
  Dir[File.dirname(__FILE__) + "/domain/**/*.rb"].each {|file| require file}

  def self.domain_modules
    Domain.constants.map { |name| Domain.const_get(name)}
  end

  def self.repositories
    domain_modules.map do |domain_module|
      [module_name(domain_module), domain_module.const_get(:Repository)]
    end.to_h
  end

  def self.module_name(domain_module)
    domain_module.to_s.downcase.split("::").last.to_sym
  end
end

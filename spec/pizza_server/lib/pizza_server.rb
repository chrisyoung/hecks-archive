module PizzaServer
  Dir[File.dirname(__FILE__) + "/domain/**/*.rb"].each {|file| require file}

  def self.repositories
    Domain.constants.map do |name|
      aggregate = Domain.const_get(name)
      aggregate_name = aggregate.to_s.downcase.split("::").last.to_sym
      [aggregate_name, aggregate.const_get(:Repository)]
    end.to_h
  end

  def self.queries
    lookup(:Queries)
  end

  def self.schemas(module_name:, command:)
    Domain.const_get(module_name.to_s.camelcase)::Schemas.const_get(command.camelcase)
  end
end

module Pizzas
  module Domain
    def self.repositories
      constants.map do |name|
        aggregate = Domain.const_get(name)
        aggregate_name = aggregate.to_s.downcase.split("::").last.to_sym
        [aggregate_name, aggregate.const_get(:Repository)]
      end.to_h
    end

    def self.modules
      constants.map do |name|
        name.to_s.downcase
      end
    end

    def self.use_cases
      constants.flat_map do |domain_module|
        const_get(domain_module)::UseCases.constants.map do |use_case|
          [ [ domain_module.to_s.underscore.to_sym, use_case.to_s.underscore.to_sym],
            const_get(domain_module)::UseCases.const_get(use_case)]
        end
      end.to_h
    end
  end
end

Dir[File.dirname(__FILE__) + "/**/*.rb"].each { |file| require file }

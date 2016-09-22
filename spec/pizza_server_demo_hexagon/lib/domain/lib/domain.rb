module PizzaServerDemoHexagon
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

    def self.queries
      lookup(:Queries)
    end

    def self.commands
      lookup(:Commands)
    end

    def self.lookup(name)
      constants.flat_map do |domain_module|
        const_get(domain_module).const_get(name).constants.map do |use_case|
          [ [ domain_module.to_s.underscore.to_sym, use_case.to_s.underscore.to_sym],
            const_get(domain_module).const_get(name).const_get(use_case)]
        end
      end.to_h
    end
  end
end

Dir[File.dirname(__FILE__) + "/**/*.rb"].each { |file| require file }

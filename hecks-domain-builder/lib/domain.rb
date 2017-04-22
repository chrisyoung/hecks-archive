class HecksDomainBuilder
  class Domain
    attr_reader :domain_modules, :name
    def initialize(name:)
      @name = name
      @domain_modules = {}
    end

    def module(name, &block)
      result = DomainModule.new(name: name)
      @domain_modules[name.to_sym] = result
      yield(result)
    end
  end
end

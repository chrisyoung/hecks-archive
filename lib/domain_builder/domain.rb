
module Hecks
  class DomainBuilder
    class Domain
      def initialize(name:)
        @domain_name = name
        @domain_modules = []
      end

      def module(name, &block)
        yield((@domain_modules << DomainModule.new(name: name)).last)
      end
    end
  end
end

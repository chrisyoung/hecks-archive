module Hecks
  class DomainBuilder
    class Domain
      attr_reader :domain_modules, :name
      def initialize(name:)
        @name = name
        @domain_modules = []
      end

      def module(name, &block)
        yield((@domain_modules << DomainModule.new(name: name)).last)
      end
    end
  end
end

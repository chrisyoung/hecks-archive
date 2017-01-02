module Hecks
  class DomainBuilder
    class DomainModule
      def initialize(name:)
        @name = name
        @objects = []
      end

      def head(name, &block)
        (@objects << Head.new(name: name)).last
      end

      def value(name)
        (@objects << Value.new(name: name)).last
      end
    end
  end
end

module Hecks
  class DomainBuilder
    class DomainModule
      attr_reader :objects, :name

      def initialize(name:)
        @name = name
        @objects = []
      end

      def head(name=nil, &block)
        return (@objects << Head.new(name: name)).last if name
        objects.find{ |o| o.is_a?(Head) }
      end

      def value(name)
        (@objects << Value.new(name: name)).last
      end
    end
  end
end

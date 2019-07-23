class NextDomain
  class DomainObject
    class Entity
      attr_reader :name
      def initialize(name)
        @name = name
      end

      def as(name)
        @as = name
      end

      def get_as
        @as
      end
    end
  end
end
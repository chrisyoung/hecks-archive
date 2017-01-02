module Hecks
  class DomainBuilder
    class DomainObject
      def initialize(name:)
        @name = name
      end

      def attributes(*values)
        @attributes = values
      end
    end
  end
end

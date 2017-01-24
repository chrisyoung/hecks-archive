module Hecks
  class DomainBuilder
    class DomainObject
      attr_reader :name, :attributes

      def initialize(name:)
        @name = name
      end

      def attributes(*values)
        @attributes = values
      end
    end
  end
end

module Hecks
  class DomainBuilder
    class Reference
      def initialize(name:)
        @name = name
      end

      def module
        @name.split("::").first
      end

      def object
        @name.split("::").last
      end
    end
  end
end

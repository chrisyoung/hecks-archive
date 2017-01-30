module Hecks
  class DomainBuilder
    class Reference
      def initialize(reference)
        @reference = reference
      end

      def referenced_entity
        @reference.split("::").map(&:camelcase).join("::")
      end

      def name
        @reference.split("::").last.camelcase + "Reference"
      end
    end
  end
end

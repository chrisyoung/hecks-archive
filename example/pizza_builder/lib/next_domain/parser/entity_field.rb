class NextDomain
  class Parser
    class EntityField
      attr_reader :name
      def initialize(name, options={})
        @optional = options[:optional]
        @name = name
      end

      def as(name)
        @as = name
      end

      def get_as
        @as
      end

      def optional?
        @optional
      end

      def attribute_name
        return name.to_s + ':' unless optional?
        name.to_s + ': nil'
      end
    end
  end
end
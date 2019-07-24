class NextDomain
  class Parser
    class ValueField
      attr_reader :name
      def initialize(name, options={})
        @optional = options[:optional]
        @name = name
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
class NextDomain
  class Parser
    class ValueField
      attr_reader :name
      def initialize(name)
        @value = name
        @name = @value
      end
    end
  end
end
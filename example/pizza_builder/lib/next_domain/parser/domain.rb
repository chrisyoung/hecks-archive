class NextDomain
  class Parser
    class Domain
      attr_reader :name, :aggregates
      attr_accessor :ruby_file
  
      def initialize(name, &block)
        @name = name
        @aggregates = []
  
        instance_eval &block
      end
      def aggregate(name, &block)
        @aggregates << Aggregate.new(name, self, &block)
      end
    
      def get_binding
        binding
      end
    
      def file_name
        folder_name + '.rb'
      end
    
      def folder_name
        @name.to_s.downcase
      end  
    end
  end
end
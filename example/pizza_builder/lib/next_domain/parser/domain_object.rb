class NextDomain
  class Parser
    class DomainObject
      attr_accessor :ruby_file
      attr_reader :name
      
      def initialize(name, aggregate, &block)
        @name = name
        @value_objects = []
        @entities = []
        @lists = []
        @aggregate = aggregate
        instance_eval &block if block
        @fields = @lists + @entities + @value_objects
      end

      def list(name, &block)
        ListField.new(name, &block).tap do |list|
          @lists << list
        end
      end
    
      def string_value(name)
        @value_objects << StringField.new(name)
      end
    
      def integer_value(name)
        @value_objects << IntegerField.new(name)
      end
      
      def currency_value(name)
        @value_objects << CurrencyField.new(name)
      end
    
      def value_object(name, &block)
        @value_objects << ValueObject.new(name, &block)
      end

      def entity(name, &block)
        EntityField.new(name, &block).tap do |entity|
          @entities << entity
        end
      end

      def file_name
        folder_name + '.rb'
      end

      def folder_name
        @name.to_s.underscore
      end

      def get_binding
        binding
      end
    end
    
  end
end
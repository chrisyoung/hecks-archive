require_relative 'domain_object/entity'
require_relative 'domain_object/value'

class NextDomain
  class DomainObject
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
      List.new(name, &block).tap do |list|
        @lists << list
      end
    end
  
    def string_value(name)
      @value_objects << StringValue.new(name)
    end
  
    def integer_value(name)
      @value_objects << IntegerValue.new(name)
    end
    
    def currency_value(name)
      @value_objects << CurrencyValue.new(name)
    end
  
    def value_object(name, &block)
      @value_objects << ValueObject.new(name, &block)
    end

    def entity(name, &block)
      Entity.new(name, &block).tap do |entity|
        @entities << entity
      end
    end

    def get_binding
      binding
    end

    class StringValue < Value;end
    class IntegerValue < Value;end
    class CurrencyValue < Value;end
    class List < Entity;end
  end
  
end
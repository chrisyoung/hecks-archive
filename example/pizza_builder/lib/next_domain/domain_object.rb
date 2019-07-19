require_relative 'domain_object_methods/entity'
require_relative 'domain_object_methods/value'
require_relative 'domain_object_methods/subtypes'

class NextDomain  
  class DomainObject
    include DomainObjectMethods
    
    def initialize(name, aggregate, &block)
      @name = name
      @value_objects = []
      @entities = []
      @lists = []
      
      
      @aggregate = aggregate
      instance_eval &block if block
      @domain_objects = @lists + @entities + @value_objects
    end

    def get_binding
      binding
    end
  end
  
end
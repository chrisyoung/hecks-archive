class NextDomain
  class Aggregate  
    attr_reader :domain, :name, :domain_objects
    attr_accessor :ruby_file
    
    def initialize(name, domain, &block)
      @name = name
      @entities = []
      @value_objects = []      
      @domain = domain
      instance_eval &block
      @domain_objects = @entities + @value_objects
    end

    def entity(name, &block)
      Entity.new(name, self, &block).tap do |entity|
        @entities << entity
      end
    end

    def file_name
      folder_name + '.rb'
    end

    def folder_name
      name.to_s.underscore
    end

    def head(name, &block)
      @head = entity(name, &block)
    end

    def value_object(name, &block)
      @value_objects << ValueObject.new(name, self, &block)
    end

    def get_binding
      binding
    end
  end
end
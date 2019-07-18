class NextDomain
  class Aggregate  
    def initialize(name, &block)
      @name = name
      @entities = []
      @value_objects = []
      instance_eval &block
    end

    def entity(name, &block)
      @entities << Entity.new(name, &block)
    end

    def head(name, &block)
      @head = entity(name, &block)
    end

    def value_object(name, &block)
      @value_objects << ValueObject.new(name, &block)
    end
  end
end
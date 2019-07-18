module DomainObjectMethods
  class Value
    def initialize(name)
      @value = name
    end
  end
end

module DomainObjectMethods
  class Entity
    def initialize(name)
      @name = name
    end

    def as(name)
      @as = name
    end
  end
end

module DomainObjectMethods
  class StringValue < Value;end
  class IntegerValue < Value;end
  class CurrencyValue < Value;end
  class List < Entity;end
end

class NextDomain
  class Aggregate
    class DomainObject
      include DomainObjectMethods
      def initialize(name, &block)
        @name = name
        @value_objects = []
        @entities = []
        @lists = []
        instance_eval &block if block
      end
    end
  end
end

class NextDomain
  class Aggregate
    class Entity < DomainObject;end
    class ValueObject < DomainObject;end
  end
end
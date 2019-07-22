class NextDomain
class DomainObject
  class Value
    attr_reader :name
    def initialize(name)
      @value = name
      @name = @value
    end
  end
end
end
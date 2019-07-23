require_relative 'parser/domain'
require_relative 'parser/domain_object'
require_relative 'parser/value_field'
require_relative 'parser/entity_field'
require_relative 'parser/aggregate'

class NextDomain
  class Parser
    attr_accessor :domain
    
    def initialize(name, &block)
      @domain = Domain.new(name, &block)
    end
    
    class Entity < DomainObject;end
    class ValueObject < DomainObject;end
    class StringField < ValueField;end
    class IntegerField < ValueField;end
    class CurrencyField < ValueField;end
    class ListField < NextDomain::Parser::EntityField;end
  end
end
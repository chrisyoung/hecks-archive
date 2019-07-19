require_relative 'domain_object_methods/entity'
require_relative 'domain_object_methods/value'
require_relative 'domain_object_methods/subtypes'
require_relative 'aggregate/domain_object'

class NextDomain
  class Aggregate
    class Entity < DomainObject;end
    class ValueObject < DomainObject;end
  end
end
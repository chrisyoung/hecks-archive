
require_relative 'aggregate/domain_object'

class NextDomain
  class Aggregate
    class Entity < DomainObject;end
    class ValueObject < DomainObject;end
  end
end
require_relative 'parser/domain'
require_relative 'parser/aggregate'

class NextDomain
  class Parser
    attr_accessor :domain
    
    def initialize(name, &block)
      @domain = Domain.new(name, &block)
    end
    
    class Entity < DomainObject;end
  end
end
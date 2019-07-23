require_relative 'parser/domain'

class NextDomain
  class Parser
    attr_accessor :domain
    
    def initialize(name, &block)
      @domain = Domain.new(name, &block)
    end
  end
end
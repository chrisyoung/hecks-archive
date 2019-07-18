require_relative 'next_domain/domain_objects'
require_relative 'next_domain/domain_object_methods'
require_relative 'next_domain/aggregate'

class NextDomain
  def initialize(name, &block)
    @name = name
    @aggregates = []
    instance_eval &block
  end

  def aggregate(name, &block)
    @aggregates << Aggregate.new(name, &block)
  end
end

def next_domain name, &block
  NextDomain.new name, &block
end
require 'singleton'
require 'pry'
require 'erubis'
require_relative 'next_domain/domain_object'
require_relative 'next_domain/aggregate'
require_relative 'next_domain/activator'

class NextDomain
  attr_reader :name, :aggregates
  def initialize(name, &block)
    @name = name
    @aggregates = []
    @files = []
    instance_eval &block
  end

  def aggregate(name, &block)
    @aggregates << Aggregate.new(name, self, &block)
  end

  def get_binding
    binding
  end

  def activate
    Activator.call(self)
    self
  end

  def print
    Activator.print
  end

  class Entity < DomainObject;end
  class ValueObject < DomainObject;end  
end

def next_domain name, &block
  NextDomain.new name, &block
end
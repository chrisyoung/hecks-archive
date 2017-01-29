require_relative 'domain'
require_relative 'domain_module'
require_relative 'domain_object'
require_relative 'value'
require_relative 'head'
require_relative 'attribute'

module Hecks
  class DomainBuilder
    attr_accessor :domain

    def initialize(domain_name:, &block)
      @domain = Domain.new(name: domain_name)
      block.yield(@domain)
      self
    end

    def domain_modules
      @domain.domain_modules
    end

    def self.build(domain_name, &block)
      new(domain_name: domain_name, &block)
    end
  end
end

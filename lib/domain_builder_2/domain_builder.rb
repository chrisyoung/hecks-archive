require_relative 'domain'
require_relative 'domain_module'
require_relative 'domain_object'
require_relative 'value'
require_relative 'head'

module Hecks
  class DomainBuilder
    def initialize(domain_name:)
      @domain_name = domain_name
      @domain_modules = []
    end

    def self.build(domain_name, &block)
      @domain = Domain.new(name: domain_name)
      block.yield(@domain)
      self
    end
  end
end

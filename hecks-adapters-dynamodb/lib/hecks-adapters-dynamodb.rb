require_relative 'repository'
require_relative 'migrate'
require_relative 'drop_all'

require 'aws-sdk'
require 'yaml'

module HecksAdapters
  # Hecks Repository interface
  class DynamoDB
    def initialize(domain:)
      @domain = domain
    end

    def [](value)
      Repository.new(DOMAIN[value.to_s.titleize.to_sym].head)
    end
  end
end

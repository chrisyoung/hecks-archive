require_relative 'repository'
require_relative 'migrate'
require_relative 'drop_all'

require 'aws-sdk'
require 'yaml'

module Hecks
  module Adapters
    class DynamoDB
      def initialize(domain:)
        @domain = domain
      end

      def [](value)
        Repository.new(DOMAIN[value.downcase].head)
      end
    end
  end
end

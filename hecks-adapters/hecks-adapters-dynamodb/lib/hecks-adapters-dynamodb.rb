require_relative 'repository'
require 'aws-sdk'
require 'yaml'

module Hecks
  module Adapters
    class DynamoDB
      def initialize(domain:)
        @domain = domain
      end

      def [](value)
        { Pizzas: Repository.new() }[value]
      end
    end
  end
end

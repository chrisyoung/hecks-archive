# frozen_string_literal: true
require_relative 'commands/commands'
require_relative 'queries/queries'

module Hecks
  module Adapters
    class Application
      attr_reader :database, :domain_spec, :events_port
      def initialize(database: nil, listeners: [], domain:)
        load(domain.spec_path)
        @domain      = domain
        @database    = database.new(domain: @domain) if @database
        @events_port = Adapters::Events.new(listeners: listeners)
        @domain_spec = Hecks.specification
      end

      def call(command_name:, module_name:, args: {})
        Runner.new(
          command_name: command_name,
          module_name:  module_name,
          args:         args,
          application:  self
        ).call
      end

      def [](module_name)
        CRUDHandler.new(module_name: module_name, application: self)
      end

      def query(query_name:, module_name:, args: {})
        QueryRunner.new(
          module_name: module_name,
          query_name:  query_name,
          args:        args,
          application: self
        ).call
      end

      def database
        return MemoryDatabase.new(domain: @domain) unless @database
        @database
      end
    end
  end
end

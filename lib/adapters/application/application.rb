# frozen_string_literal: true
require_relative 'queries/find_by_id'
require_relative 'commands/update'
require_relative 'commands/create'
require_relative 'commands/delete'
require_relative 'queries/find_by_id'
require_relative 'crud_handler'


module Hecks
  module Adapters
    class Application
      def initialize(database: nil, listeners: [], domain:)
        @domain           = domain
        @database         = (database && database.new(domain: domain)) ||
                            Hecks::Adapters::MemoryDatabase.new(domain: domain)
        @events_port      = Adapters::Events.new(listeners: listeners)
      end

      def call(command_name:, module_name:, args: {})
        @module_name  = module_name.to_sym
        @command_name = command_name.to_sym
        @args         = args

        fetch_command
        run_command
        broadcast
        command
      end

      def [](module_name)
        CRUDHandler.new(module_name: module_name, application: self)
      end

      def query(query_name:, module_name:, args: {})
        @module_name = module_name
        @query_name  = query_name.to_sym

        Queries.const_get(query_name.to_s.camelcase).new(repository: database[module_name]).call(args)
      end

      private

      attr_reader :command_name, :command, :module_name, :database, :args, :events_port, :domain

      def fetch_command
        @command = Commands.const_get(command_name.to_s.camelcase).new(
          repository: database[module_name],
          args:       args
        )
      end

      def run_command
        @command = command.call
      end

      def broadcast
        events_port.send(command: command, module_name: module_name)
      end
    end
  end
end

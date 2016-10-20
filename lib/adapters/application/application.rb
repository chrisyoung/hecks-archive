# frozen_string_literal: true
require_relative 'validations'
require_relative 'queries/find_by_id'

module Hecks
  module Adapters
    class Application
      def initialize(database: nil, listeners: [], domain:)
        @domain           = domain
        @database         = Hecks::Adapters::MemoryDatabase.new(domain: domain)
        @validations      = Validations
        @events_port      = Adapters::Events.new(listeners: listeners)
      end

      def call(command_name:, module_name:, args: {})
        @module_name  = module_name.to_sym
        @command_name = command_name.to_sym
        @args         = args

        fetch_command
        validate
        run_command
        broadcast
        command
      end

      def query(query_name:, module_name:, args: {})
        @module_name = module_name
        @query_name  = query_name.to_sym

        Queries.const_get(query_name.to_s.camelcase).new(repository: database[module_name]).call(args)
      end

      private

      attr_reader :command_name, :command, :module_name, :database, :args, :events_port, :validations, :domain, :validation_command

      def validate
        return unless validations
        @validation_command = validations.new(
          command:     command,
          module_name: module_name,
          domain:      domain
        ).call
      end

      def fetch_command
        @command = Commands.const_get(command_name.to_s.camelcase).new(
          repository: database[module_name],
          args:       args
        )
      end

      def run_command
        return unless validation_command
        @command.errors = validation_command.errors
        @command = command.call unless @command.errors.count.positive?
      end

      def broadcast
        events_port.send(command: command, module_name: module_name)
      end
    end
  end
end

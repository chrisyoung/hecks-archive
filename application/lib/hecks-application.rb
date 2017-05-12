# frozen_string_literal: true
$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'hecks-memory-database'
require 'hecks-domain'

require_relative 'commands/commands'
require_relative 'command_runner'
require_relative 'queries/queries'
require_relative 'events'
require_relative 'logger'
require_relative 'validator'

# The Applicaiton port.  Adapters usually talk to the domain through
# HecksApplication
class HecksApplication
  attr_reader :database, :domain_spec, :events_port
  def initialize(database: nil, listeners: [], domain:)
    load(domain.spec_path)
    @domain      = domain
    @database    = database
    @events_port = HecksEvents.new(listeners: listeners)
    @domain_spec = DOMAIN
  end

  def call(command_name:, module_name:, args: {})
    CommandRunner.new(
      command_name: command_name,
      module_name:  module_name,
      args:         args,
      application:  self
    ).call
  end

  def [](module_name)
    Commands::CRUDHandler.new(module_name: module_name, application: self)
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
    return @database.new(domain: @domain) if @database
    return HecksAdapters::MemoryDatabase.new(domain: @domain)
  end
end

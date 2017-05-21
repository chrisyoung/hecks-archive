# frozen_string_literal: true
$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'hecks-memory-database'
require 'hecks-domain'


require_relative 'commands/commands'
require_relative 'command_runner'
require_relative 'queries/queries'
require_relative 'events'
require_relative 'hecks_logger'
require_relative 'validator'
require_relative 'command_queue'
require_relative 'hecks-delayed-command-queue'

# The Applicaiton port.  Adapters usually talk to the domain through
# an HecksApplication instance.
class HecksApplication
  attr_reader :database, :domain_spec, :events_port, :command_queue

  def initialize(database: nil, listeners: [], domain:, command_queue: HecksApplication::CommandQueue)
    load(domain.spec_path)
    @domain        = domain
    @database      = database
    @events_port   = HecksEvents.new(listeners: listeners)
    @domain_spec   = DOMAIN
    @command_queue = command_queue
  end

  # This runs an arbitrarily named command.  Would be nice to unify it into the
  # #[] syntax
  def call(command_name:, module_name:, args: {})
    CommandRunner.new(
      command_name: command_name,
      module_name:  module_name,
      args:         args,
      application:  self,
      queue:        command_queue
    ).run
  end

  # app[:domain_module].crud_command
  def [](module_name)
    Commands::CRUDHandler.new(module_name: module_name, application: self)
  end

  # The Query interface allows you to seperate your reads from your operations.
  # CQRS is a really awful name for something so rad
  def query(query_name:, module_name:, args: {})
    QueryRunner.new(
      module_name: module_name,
      query_name:  query_name,
      args:        args,
      application: self
    ).call
  end

  # Access to the "Hecks Database".  By default Hecks uses a memory database.
  # Sorry so sloppy.
  def database
    return @database.new(domain: @domain) if @database
    return HecksAdapters::MemoryDatabase.new(domain: @domain)
  end
end

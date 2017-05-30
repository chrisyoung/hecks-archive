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

# The Applicaiton port.  Adapters usually talk to the domain through
# an HecksApplication instance.
class HecksApplication
  attr_reader :database, :domain_spec, :events_port, :command_queue, :domain

  def initialize(config)
    @domain        = config[:domain]
    load(domain.spec_path)
    @domain_spec   = DOMAIN
    @domain        = config[:domain]
    @database      = config[:database]
    @events_port   = HecksEvents.new(listeners: config[:listeners] || [])
    @command_queue = config[:command_queue] || HecksApplication::CommandQueue
    @command_queue.application = self
  end

  # This runs an arbitrarily named command.  Would be nice to unify it into the
  # #[] syntax
  def call(command_name:, module_name:, args: {})
    command_queue.enqueue(
      command: {
        name:   command_name,
        module: module_name,
        args:   args
      }
    )
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

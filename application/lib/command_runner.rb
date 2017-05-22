class HecksApplication
  # Run an application command, with validations and broacast lifecycle events
  class CommandRunner
    # Public Attributes
    attr_reader :command_name, :module_name, :command, :args

    def initialize(command_name:, module_name:, args:, application:, queue: HecksApplication::CommandQueue)
      @command_name = command_name
      @module_name  = module_name
      @args         = args
      @application  = application
      @domain_spec  = application.domain_spec
      @queue        = queue
    end

    # This is basically the "entry point" for running an opperation in Hecks.
    def run
      generate_id
      configure_command
      enqueue_command
      broadcast
      self
    end

    # this result allows the client to have a record that an operation was run
    # including the "ticket id"
    def result
      { id: id, args: args }
    end

    private

    # The private api for this class
    attr_reader :command_name, :args, :application, :domain_spec, :id, :queue

    # This is an id that can be used to query for the results of this operations
    # later
    def generate_id
      @id = SecureRandom.uuid
    end

    # Broadcast that this command was run so that listeners can respond to
    # lifecycle events
    def broadcast
      application.events_port.send(
        command:     command,
        module_name: module_name
      )
    end

    # As far as hecks is concerned, commands will always be run "later".  This
    # is essential for CQRS support
    def enqueue_command
      queue.enqueue(command, id)
    end

    # Look up the command and configure it
    def configure_command
      @command = Commands.const_get(command_name.to_s.camelcase).new(
        repository:    fetch_repository,
        args:          args,
        domain_module: fetch_module,
        id:            id
      )
    end

    # Look up the repoitory associated with the domain module.
    def fetch_repository
      application.database[module_name]
    end

    # look up the domain module
    def fetch_module
      domain_spec.domain_modules[module_name.to_s.camelize.to_sym]
    end
  end
end

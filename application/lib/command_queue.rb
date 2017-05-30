require 'sidekiq'
require_relative 'command_runner'

Sidekiq.configure_client do |config|
  config.redis = { db: 1 }
end

class HecksApplication
  # Manages a list of commands to be run
  class CommandQueue
    include Singleton

    # a list of commands
    attr_reader :queue
    attr_accessor :application

    # The "Queue" is just a basic array
    def initialize
      @queue       = []
    end

    # HecksCommandQueue calls the command immediately.  However your client
    # should not rely on the response but should use the query interface
    # instead, as it is likely that in production the app will be running on a
    # robust queue like
    # Redis
    def self.enqueue(command:)
      CommandRunner.new(
        command:      command,
        application:  instance.application
      ).run
    end

    def self.application= value
      instance.application= value
    end
  end
end

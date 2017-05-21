require_relative 'command_runner'

class HecksApplication
  # Manages a list of commands to be run
  class CommandQueue
    include Singleton

    attr_reader :queue

    def initialize
      @queue = []
    end

    def self.enqueue(command, id)
      instance.queue << command
      command.call
      instance.queue.delete(command)
    end
  end
end

require_relative 'bus_runner'
# Holds a list of commands to be run
class HecksApplication
  class CommandBus
    include Singleton

    attr_reader :queue

    def initialize
      @queue = []
    end

    def self.enqueue(command, id)
      instance.queue << command
    end

    def self.empty?
      instance.queue.empty?
    end

    def self.run
      instance.queue.each do |command|
        command.call
        instance.queue.delete(command)
      end
      BUS_RUNNER_THREAD.join
    end
  end
end

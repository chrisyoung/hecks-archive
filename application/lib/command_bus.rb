require_relative 'command_bus_runner'

class HecksApplication
  # Manages a list of commands to be run
  class CommandBus
    include Singleton

    attr_reader :queue

    def initialize
      @queue = []
      CommandBusRunner.run
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
      CommandBusRunner.thread.join
    end
  end
end

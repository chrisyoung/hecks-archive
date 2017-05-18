class HecksApplication
  # Empties the command bus in a seperate thread.
  class CommandBusRunner
    include Singleton

    attr_reader :thread

    def run
      @thread = Thread.new do
        while true do
          next if HecksApplication::CommandBus.empty?
          HecksApplication::CommandBus.run
        end
      end
    end

    def self.run
      instance.run
    end

    def self.thread
      instance.thread
    end
  end
end

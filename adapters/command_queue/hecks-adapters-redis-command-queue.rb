# require 'sidekiq'
# require_relative 'command_runner'
#
# Sidekiq.configure_client do |config|
#   config.redis = { db: 1 }
# end

require 'hecks'

class HecksAdaptersRedisCommandQueue
  class HecksJob
    include Sidekiq::Worker

    def perform(command)
      HecksApplication::CommandRunner.new(
        command:      command,
        application:  app
      ).run
    end
  end
end

class HecksDelayedCommandQueue
  def self.application= value
  end
  def self.enqueue(command:)
    HecksJob.perform_async(command)
  end
end

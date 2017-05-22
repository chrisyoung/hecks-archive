require 'sidekiq'

Sidekiq.configure_client do |config|
  config.redis = { db: 1 }
end

Sidekiq.configure_server do |config|
  config.redis = { db: 1 }
end

class HecksDelayedCommandQueue
  class HecksJob
    include Sidekiq::Worker

    def perform(command, id)
      command.call
    end
  end
end

class HecksDelayedCommandQueue
  def self.enqueue(command, id)
    HecksJob.perform_async(command, id)
  end
end

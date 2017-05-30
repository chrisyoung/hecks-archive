require 'sidekiq'
require_relative '../../application/lib/hecks-delayed-command-queue'
require 'hecks'
require 'pizza_builder'

Sidekiq.configure_client do |config|
  config.redis = { db: 1 }
end

Sidekiq.configure_server do |config|
  config.redis = { db: 1 }
end

HecksApp = HecksApplication.new(
  domain:   PizzaBuilder,
  database: HecksAdapters::DynamoDB
)

class HecksDelayedCommandQueue
  class HecksJob
    include Sidekiq::Worker

    def perform(command)
      HecksApplication::CommandRunner.new(
        command:      command,
        application:  HecksApp
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

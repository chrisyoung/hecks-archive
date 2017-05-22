require_relative '../../spec/load_path'
require 'sidekiq'
require 'hecks'
require_relative "lib/pizza_builder.rb"

HECKS_APP = HecksApplication.new(
  domain: PizzaBuilder
)

class HecksDelayedCommandQueue
  class HecksJob
    include Sidekiq::Worker

    def perform(command, id)
      command.call
    end
  end
end

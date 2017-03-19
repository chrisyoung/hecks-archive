# frozen_string_literal: true
module Hecks
  module Adapters
    def self.require_dependencies
      require_local && return if dev_mode?
      require_gems
    end

    def self.dev_mode?
      ENV['HECKS_PATH']
    end

    def self.require_local
      require_relative 'memory_database/memory_database'
      require_relative 'events/events'
      require_relative 'logger/logger'
      require_relative 'validator/validator'
    end

    def self.require_gems
      require 'hecks-application'
      require 'hecks-adapters-resource-server'
      require 'hecks-adapters-sql-database'
    end
  end
end

Hecks::Adapters.require_dependencies

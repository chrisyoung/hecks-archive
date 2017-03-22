# frozen_string_literal: true

require 'thor'

module Hecks
  module Adapters
    def self.require_dependencies
      require_local && return if dev_mode?
      require_gems
    end

    def self.dev_mode?
      !!ENV['HECKS_PATH']
    end

    def self.require_local
      require_relative '../../hecks-application/lib/hecks-application'
      require_relative '../hecks-adapters-resource-server/lib/hecks-adapters-resource-server'
      require_relative '../hecks-adapters-sql-database/lib/hecks-adapters-sql-database'
    end

    def self.require_gems
      require 'hecks-application'
      require 'hecks-adapters-resource-server'
      require 'hecks-adapters-sql-database'
    end
  end
end

require_relative 'memory_database/memory_database'
require_relative 'events/events'
require_relative 'logger/logger'
require_relative 'validator/validator'

Hecks::Adapters.require_dependencies

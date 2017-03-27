# frozen_string_literal: true
require 'thor'

if `gem list`.include?('hecks')
  require 'hecks-application'
  require 'hecks-adapters'
  require 'hecks-adapters-sql-database'
  require 'hecks-adapters-resource-server'
  require 'hecks-adapters-dynamodb'
else
  ENV['HECKS_PATH'] = File.dirname(__FILE__) + '/../hecks/lib/hecks'
  require_relative '../../hecks-application/lib/hecks-application'
  require_relative '../../hecks-adapters/lib/hecks-adapters'
  require_relative '../../hecks-adapters-sql-database/lib/hecks-adapters-sql-database'
  require_relative '../../hecks-adapters-resource-server/lib/hecks-adapters-resource-server'
  require_relative '../../hecks-adapters-dynamodb/lib/hecks-adapters-dynamodb'
end

require_relative 'console'
require_relative 'packager'
require_relative 'cli'

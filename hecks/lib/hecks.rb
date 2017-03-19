# frozen_string_literal: true

if ENV['HECKS_PATH']
  require_relative '../../hecks-application/lib/hecks-application'
  require_relative '../../hecks-domain/lib/hecks-domain'
  require_relative '../../hecks-adapters/lib/hecks-adapters'
else
  require 'hecks-application'
  require 'hecks-domain'
  require 'hecks-adapters'
end

require_relative 'packager'
require_relative 'packager'
require_relative 'cli'
require_relative 'console'

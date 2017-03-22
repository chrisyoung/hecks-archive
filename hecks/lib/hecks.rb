# frozen_string_literal: true
require 'thor'



if `gem list`.include?('hecks (')
  require 'hecks-application'
  require 'hecks-domain'
  require 'hecks-adapters'
else
  ENV['HECKS_PATH'] = File.dirname(__FILE__) + '/../hecks/lib/hecks'

  require_relative '../../hecks-application/lib/hecks-application'
  require_relative '../../hecks-domain/lib/hecks-domain'
  require_relative '../../hecks-adapters/lib/hecks-adapters'
end
require_relative 'console'
require_relative 'packager'
require_relative 'cli'

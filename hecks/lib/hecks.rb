# frozen_string_literal: true
require 'hecks-application'
require 'hecks-domain'
require_relative 'packager'
require_relative 'cli'
require_relative 'console'
require 'hecks-adapters'

module Hecks
  def self.version
    File.read("Version").gsub("\n", '')
  end
end

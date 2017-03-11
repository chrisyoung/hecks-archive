# frozen_string_literal: true
require 'active_support/inflector'
require 'hecks-packager'
require_relative 'generate'
require_relative 'package'
require_relative 'test'
require_relative 'console'
require_relative 'command_runner'
require_relative 'build'

module Hecks
  class CLI < Thor
    package_name 'hecks'

    desc 'generate', 'generate'
    subcommand('generate', Generate)

    desc 'package', 'package'
    subcommand('package', Package) if File.file?('Domain')

    desc 'test', 'test'
    subcommand('test', Test) if File.file?('hecks.gemspec')

    long_desc      'Generate a domain'
    method_option  :dryrun, aliases: '-d', type: :boolean, desc: 'Output commands without running'

    register(Hecks::Domain::CLI::New, 'new', 'new', 'Create a new Domain') if File.file?('Domain')
  end
end

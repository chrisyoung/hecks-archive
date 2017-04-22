# frozen_string_literal: true
require 'active_support/inflector'
require 'hecks-adapters-resource-server'
require_relative 'generate'
require_relative 'test'
require_relative 'console'
require_relative 'command_runner'
require_relative 'build'

# A command line interface for generating and interacting with Hecks domains
class HecksCLI < Thor
  package_name 'hecks'

  desc 'generate', 'generate'
  subcommand('generate', Generate)

  desc 'test', 'test'
  subcommand('test', Test) if File.file?('hecks.gemspec')

  long_desc      'Generate a domain'
  method_option  :dryrun, aliases: '-d', type: :boolean, desc: 'Output commands without running'

  register(HecksDomain::CLI::New, 'new', 'new', 'Create a new Domain') if File.file?('Domain')
end

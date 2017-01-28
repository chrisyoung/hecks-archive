# frozen_string_literal: true
require_relative 'commands/new'
require_relative 'commands/generate'
require 'active_support/inflector'
require 'pry'
require_relative 'builder'
require_relative '../domain_builder/builder'

module Hecks
  class Executable < Thor
    package_name 'hecks'

    desc 'generate:domain_object', 'generate domain objects'
    method_option :type,
                  aliases:  '-t',
                  required: true,
                  desc:     'The type of the domain object you want to generate',
                  banner:   '[OBJECT_TYPE]',
                  enum:     %w(entity value_object aggregate)
    register GenerateDomainObject, 'generate:domain_object', 'generate:domain_object', 'Generate Domain Objects'

    desc 'new', 'Generate a new domain'
    long_desc     'A domain'
    method_option :dryrun,
                  aliases:  '-d',
                  type:     :boolean,
                  desc:     'Output commands without running'
    register Commands::New, 'new', 'new', 'Create a new Domain'
  end
end

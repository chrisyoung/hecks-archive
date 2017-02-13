# frozen_string_literal: true
require 'active_support/inflector'
require 'pry'
require_relative 'command_runner'
require_relative 'commands'

module Hecks
  class CLI < Thor
    package_name 'hecks'

    desc          'generate:domain_object', 'generate domain objects'
    method_option :type,
                  aliases:  '-t',
                  required: true,
                  desc:     'The type of the domain object you want to generate',
                  banner:   '[OBJECT_TYPE]',
                  enum:     %w(entity value_object aggregate reference)
    register      GenerateDomainObject,
                  'generate:domain_object',
                  'generate:domain_object',
                  'Generate Domain Objects'

    desc           'generate:resource_server', 'generate resource_server'
    register       GenerateResourceServer,
                   'generate:resource_server',
                   'generate:resource_server',
                   'Generate A Resource Server for a domain'

    long_desc      'Generate a domain'
    method_option  :dryrun,
                   aliases:  '-d',
                   type:     :boolean,
                   desc:     'Output commands without running'
    register       GenerateDomain,
                   'generate:domain',
                   'generate:domain',
                   'Create a new Domain'
  end
end

# frozen_string_literal: true
require 'active_support/inflector'
require 'pry'
require_relative 'command_runner'
require_relative 'commands'

module Hecks

  class Generate < Thor
    desc          'domain_objects', 'generate domain objects'
    method_option :type,
                  aliases:  '-t',
                  required: true,
                  desc:     'The type of the domain object you want to generate',
                  banner:   '[OBJECT_TYPE]',
                  enum:     %w(entity value_object aggregate reference)
    register      GenerateDomainObject,
                  'domain_object',
                  'domain_object',
                  'Generate Domain Objects'

    desc           'resource_server', 'generate resource_server'
    register       GenerateResourceServer,
                   'resource_server',
                   'resource_server',
                   'Generate A Resource Server for a domain'
  end

  class CLI < Thor

    package_name 'hecks'

    desc 'generate', 'generate'
    subcommand 'generate', Generate



    long_desc      'Generate a domain'
    method_option  :dryrun,
                   aliases:  '-d',
                   type:     :boolean,
                   desc:     'Output commands without running'
    register       New,
                   'new',
                   'new',
                   'Create a new Domain'
  end
end

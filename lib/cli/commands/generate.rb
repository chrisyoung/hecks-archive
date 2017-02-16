# frozen_string_literal: true
require_relative 'generate/new'
require_relative 'generate/generate_domain_object'
require_relative 'generate/generate_resource_server'
require_relative 'generate/generate_package'
require_relative 'generate/builder'


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

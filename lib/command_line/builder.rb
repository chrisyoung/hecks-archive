# frozen_string_literal: true
require 'json'
require_relative 'command_runner'

module Hecks
  class Builder
    def initialize(builder: nil, schema: nil, name:, dry_run: false)
      @name = name

      @domain = Domain.new(schema: schema) if schema
      @domain = Domain.new(builder: builder.domain) if builder

      @runner = CommandRunner.new(domain, name, dry_run)
    end

    def call
      puts "\n"
      generate :domain
      generate :modules
      generate :value_objects
    end

    private

    attr_reader :runner, :name, :domain

    def generate(command)
      case command
      when :domain
        runner.call(['new', '-n', name], from_domain_dir: false)
      when :modules
        domain.modules.each do |domain_module|
          runner.call([
                        'generate:domain_object',
                        '-t', 'aggregate',
                        '-n', domain_module.name,
                        '--head_name', domain_module.head.name,
                        '-a', domain_module.head.fields
                      ])
        end
      when :value_objects
        domain.value_objects.each do |value_object|
          runner.call([
                        'generate:domain_object',
                        '-t', 'value_object',
                        '-n', value_object.name,
                        '-m', value_object.module_name,
                        '-a', value_object.fields
                      ])
        end
      else
        raise "unrecognized command: #{command}"
      end
    end
  end
end

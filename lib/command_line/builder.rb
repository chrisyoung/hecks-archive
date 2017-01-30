# frozen_string_literal: true
require 'json'
require_relative 'command_runner'

module Hecks
  class Builder
    def initialize(builder: nil, name:, dry_run: false)
      @name = name
      @domain = builder.domain if builder
      @runner = CommandRunner.new(domain, name, dry_run)
    end

    def call
      puts "\n"
      generate :domain
      generate :modules
      generate :value_objects
      generate :references
    end

    private

    attr_reader :runner, :name, :domain

    def generate(command)
      case command
      when :references
        domain.domain_modules.each do |domain_module|
          domain_module.references.each do |reference|
            runner.call([
              'generate:domain_object',
              '-t', 'reference',
              '-n', reference.name,
              '-m', domain_module.name,
              '-r', reference.referenced_entity
            ])
          end
        end
      when :domain
        runner.call(['new', '-n', name])
      when :modules
        domain.domain_modules.each do |domain_module|
          runner.call(
            [
              'generate:domain_object',
              '-t', 'aggregate',
              '-n', domain_module.name,
              '--head_name', domain_module.head.name,
              '-a', domain_module.head.attributes
            ])
        end
      when :value_objects
        domain.domain_modules.each do |domain_module|
          (domain_module.objects - [domain_module.head]).each do |value_object|
          runner.call([
            'generate:domain_object',
            '-t', 'value_object',
            '-n', value_object.name,
            '-m', domain_module.name,
            '-a', value_object.attributes
          ])
        end
      end

      else
        raise "unrecognized command: #{command}"
      end
    end
  end
end

# frozen_string_literal: true
require 'json'
require_relative 'command_runner'
require_relative 'builder/value_object_command_line_builder'
require_relative 'builder/aggregate_command_line_builder'
require_relative 'builder/reference_command_line_builder'

module Hecks
  class Builder
    def initialize(hecks_file:, name:, dry_run: false)
      @name   = name
      @domain = eval(hecks_file).domain
      @dry_run = dry_run
      @runner = CommandRunner.new(domain, name, dry_run)
    end

    def call
      delete_tmpfile
      puts "\n"
      generate :domain
      generate :modules
      generate :value_objects
      generate :references
      execute_tmpfile unless @dry_run
    end

    private

    attr_reader :runner, :name, :domain

    def delete_tmpfile
      return unless Pathname('tmp/hecks').exist?
      FileUtils.rm('tmp/hecks')
    end

    def execute_tmpfile
      exec('bash -x tmp/hecks')
    end

    def generate(command)
      case command
      when :references
        ReferenceCommandLineBuilder.build(domain, runner)
      when :domain
        runner.call(['new', '-n', name])
      when :modules
        AggregateCommandLineBuilder.build(domain, runner)
      when :value_objects
        ValueObjectCommandLineBuilder.build(domain, runner)
      else
        raise "unrecognized command: #{command}"
      end
    end
  end
end

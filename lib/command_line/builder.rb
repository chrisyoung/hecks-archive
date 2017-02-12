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

      FileUtils.rm('tmp/hecks')
      @runner = CommandRunner.new(domain, name, dry_run)
    end

    def call
      puts "\n"
      generate :domain
      generate :modules
      generate :value_objects
      generate :references
      exec('bash tmp/hecks')
    end

    private

    attr_reader :runner, :name, :domain

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

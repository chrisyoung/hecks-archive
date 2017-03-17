# frozen_string_literal: true
require 'pathname'

module Hecks
  module Domain
    module CLI
      class CommandBuilder
        def initialize(name:, dry_run: false)
          @name   = name
          @domain = DOMAIN
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
          execute_tmpfile && return unless @dry_run
          print_tmpfile
        end

        private

        attr_reader :runner, :name, :domain

        def print_tmpfile
          puts File.read('tmp/hecks')
        end

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
  end
end

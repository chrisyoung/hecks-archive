require_relative 'builder/env'
require 'json'

module Hecks
  class Builder
    def initialize(hexagon_schema, name:, dry_run: false)
      @name = name
      @hexagon = Hexagon.new(hexagon_schema)
      @runner  = CommandRunner.new(hexagon, name, dry_run)
    end

    def call
      puts "\n"
      generate :modules
      generate :value_objects
      generate :module_services
    end

    private

    attr_reader :hexagon, :runner, :name

    def generate(command)
      case command
      when :modules
        hexagon.modules.each do |domain_module|
          runner.call([
            'generate:domain_object',
            '-t', 'aggregate',
            '-n', domain_module.name,
            '--head_name', domain_module.head.name,
            '-a', domain_module.head.fields])
        end
      when :value_objects
        hexagon.value_objects.each do |value_object|
          runner.call([
            'generate:domain_object',
            '-t', 'value_object',
            '-n', value_object.name,
            '-m', value_object.module_name,
            '-a', value_object.fields
          ])
        end
      when :module_services
        hexagon.module_services.each do |s|
          runner.call([
            "generate:adapter ",
            '-t', s.name,
            '-m', s.domain_module.name,
            '-a', s.attributes
          ])
        end
      else
        raise "unrecognized command: #{command}"
      end
    end
  end
end

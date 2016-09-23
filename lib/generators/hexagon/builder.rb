require_relative 'builder/env'
require 'json'

module Hecks
  class Builder
    def initialize(hexagon_schema, dry_run: false)
      @hexagon = Hexagon.new(hexagon_schema)
      @runner  = CommandRunner.new(hexagon, dry_run)
    end

    def call
      puts "\n"
      generate :hexagon
      generate :modules
      generate :value_objects
      generate :module_services
      generate :hexagon_services
    end

    private

    attr_reader :hexagon, :runner

    def generate(command)
      case command
      when :hexagon
        runner.call(['new', hexagon.name], from_hex_dir: false)
      when :modules
        hexagon.modules.each { |domain_module| runner.call(['generate aggregate', domain_module.name, '--head_name', domain_module.head.name, '-a', domain_module.head.fields]) }
      when :value_objects
        hexagon.value_objects.each { |value_object| runner.call(['generate value_object', value_object.name, '-m', 'pizzas', '-a', value_object.fields]) }
      when :module_services
        hexagon.module_services.each { |s| runner.call(["generate #{s.name}", '-m', s.domain_module.name, '-a', s.attributes]) }
      when :hexagon_services
        hexagon.services.each { |s| runner.call(["generate #{s}"]) }
      else
        raise "unrecognized command: #{command}"
      end
    end
  end
end

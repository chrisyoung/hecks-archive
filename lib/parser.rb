require_relative 'parser/hexagon'
require_relative 'parser/domain_module'
require_relative 'parser/domain_object'
require_relative 'parser/field'
require_relative 'parser/module_service'

module Hecks
  class Parser
    def initialize(hexagon_schema)
      @hexagon = Hexagon.new(hexagon_schema)
      @dry_run = true
    end

    def call
      generate_hexagon
      generate_modules
      generate_test_module
      generate_value_objects
      generate_module_services
      generate_hexagon_services
    end

    private

    attr_reader :hexagon, :dry_run

    def generate_hexagon
      command = ["new #{hexagon.name}"]
      puts "\n", 'hecks ' + command.join(' ')
      puts "\n", `#{(['../../bin/hecks'] + command).join(' ')}`, "\n" unless dry_run
    end

    def generate_test_module
      run(['domain:aggregate', 'test', '-h', 'entity', '-a', 'name:string children[child]'])
    end

    def generate_modules
      hexagon.modules.each do |domain_module|
        run(['domain:aggregate', domain_module.name, '-h', domain_module.head.name, '-a', domain_module.head.fields.map(&:to_s).join(" ")])
      end
    end

    def generate_value_objects
      hexagon.value_objects.each do |value_object|
        run(['domain:value_object', value_object.name, '-m', 'pizzas', '-a', value_object.fields.map(&:to_s)])
      end
    end

    def generate_module_services
      hexagon.module_services.each { |s| run(["adapter:#{s.name}", '-m', s.domain_module.name]) }
    end

    def generate_hexagon_services
      hexagon.services.each { |s| run(["adapter:#{s}"]) }
    end

    def full_command(command)
      (['cd', "#{hexagon.name}_hexagon", '&&', '../../../bin/hecks'] + command).join(' ')
    end

    def run(command)
      puts 'hecks ' + command.join(' ')
      puts("\n", `#{full_command(command)}`, "\n") unless dry_run
    end
  end
end

require_relative 'parser/hexagon'
require_relative 'parser/domain_module'
require_relative 'parser/domain_object'
require_relative 'parser/field'
module Hecks
  class Parser
    def initialize(hexagon)
      @hexagon = Hexagon.new(hexagon)
    end

    def call
      generate_hexagon
      generate_modules
      generate_hexagon_services
    end

    private

    attr_reader :hexagon

    def generate_hexagon
      command = "../../bin/hecks new #{hexagon.name}"
      puts command
      puts `#{command}`
    end

    def generate_modules
      hexagon.modules.each do |domain_module|
        run_command(
          [
            'cd', hexagon_directory, '&&',
            hecks_binary, 'domain:aggregate', domain_module.name,
            '-h', domain_module.head.name,
            '-a', domain_module.head.fields.map(&:to_s).join(" ")
          ].join ' '
        )
        generate_value_objects(domain_module)
        generate_module_services(domain_module)
      end
    end

    def generate_value_objects(domain_module)
      domain_module.value_objects.each do |value_object|
        run_command(
          [
            'cd', hexagon_directory, '&&',
            hecks_binary, 'domain:value_object', value_object.name,
            '-m', 'pizzas',
            '-a', value_object.fields.map(&:to_s).join(" ")
          ].join ' '
        )
      end
    end

    def run_command(command)
      puts command
      puts `#{command}`
    end

    def hexagon_directory
      "#{hexagon.name}_hexagon"
    end

    def hecks_binary
      '../../../bin/hecks'
    end

    def generate_module_services(domain_module)
      domain_module.services.each do |service|
        run_command([
          'cd', hexagon_directory, '&&',
          hecks_binary, "adapter:#{service}",
          '-m', domain_module.name
        ].join(" "))
      end
    end

    def generate_hexagon_services
      hexagon.services.each do |service|
        run_command([
          'cd', hexagon_directory, '&&',
          hecks_binary, "adapter:#{service}",
        ].join(" "))
      end
    end
  end
end

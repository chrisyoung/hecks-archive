
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
      generate_module_services
      generate_hexagon_services
    end

    private

    attr_reader :hexagon

    def generate_hexagon
      puts `../../bin/hecks new #{hexagon.name}`
    end

    def generate_modules
      hexagon.modules.each do |domain_module|
        puts `#{
          [
            'cd', hexagon_directory, '&&',
            hecks_binary, 'domain:aggregate', domain_module.name,
            '-h', domain_module.head.name,
            '-a', 'name:string description:string toppings: [topping]'
          ].join ' '
        }`
        generate_value_objects(domain_module)
      end
    end

    def generate_value_objects(domain_module)
      domain_module.value_objects.each do |value_object|
        puts `#{
          [
            'cd', hexagon_directory, '&&',
            hecks_binary, 'domain:value_object', value_object.name,
            '-m', 'pizzas',
            '-a', 'name:string'
          ].join ' '
        }`
      end
    end

    def hexagon_directory
      "#{hexagon.name}_hexagon"
    end

    def hecks_binary
      '../../../bin/hecks'
    end

    def generate_module_services
    end

    def generate_hexagon_services
    end
  end
end

require 'active_support/inflector'

class Hecks < Thor
  class Hexagon < Thor::Group
    include Thor::Actions

    argument :name, optional: true

    def self.source_root
      File.dirname(__FILE__)
    end

    def create_hexagon_folder
      directory('templates/hexagon', "#{name}")
    end

    private

    def name
      @name + '_hexagon'
    end

    def domain_name
      @name + '_domain'
    end

    def module_name
      name.camelize
    end

    def domain_module_name
      domain_name.camelize
    end

    def condensed_module_name
      name.gsub('_', '')
    end
  end
end

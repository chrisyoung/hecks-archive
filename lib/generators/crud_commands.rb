class Hecks < Thor
  class CrudCommands < Thor::Group
    include Thor::Actions

    class_option :aggregate_name, aliases: "-m", desc: "the name of the module to create the use case in"

    def self.source_root
      File.dirname(__FILE__)
    end

    def hexagon_name
      Dir.pwd.split('/').last
    end

    def hexagon_module_name
      hexagon_name.camelize
    end

    def aggregate_name
      options[:aggregate_name]
    end

    def aggregate_module_name
      aggregate_name.camelize
    end

    def create_value_object_folder
      directory('templates/crud_commands', ".")
    end
  end
end

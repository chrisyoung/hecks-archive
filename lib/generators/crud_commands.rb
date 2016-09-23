class Adapter
  class CrudCommands < Thor::Group
    include Thor::Actions

    class_option :module_name, aliases: "-m", desc: "the name of the aggregate module"
    class_option :attributes,  aliases: "-a", desc: "required attributes will be validated by a schema"

    def self.source_root
      File.dirname(__FILE__)
    end

    def create_value_object_folder
      directory('templates/crud_commands', ".")
    end

    private

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
      options[:module_name].camelize
    end
  end
end

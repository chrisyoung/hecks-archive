class Adapter
  class ResourceServer < Thor::Group
    include Thor::Actions

    def self.source_root
      File.dirname(__FILE__)
    end

    def create_value_object_folder
      directory('templates/resource_server', ".")
    end

    private

    def hexagon_name
      Dir.pwd.split('/').last
    end

    def hexagon_module_name
      hexagon_name.camelize
    end
  end
end

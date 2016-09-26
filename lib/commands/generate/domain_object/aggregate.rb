class DomainObject
  class Aggregate < Thor::Group
    include Thor::Actions

    class_option :head_name, :aliases => "-h", :desc => "the name of the aggregate head"
    class_option :attributes, :aliases => "-a", type: :hash, :desc => "attributes for the aggregate head"
    class_option :name, :aliases => "-n", :desc => "attributes for the aggregate head"

    def self.source_root
      File.dirname(__FILE__)
    end

    def create_aggregate_folder
      directory('templates/aggregate', '.')
    end

    private

    def head_name
      options[:head_name]
    end

    def head_module_name
      head_name.camelize
    end

    def attribute_names_as_strings
      attributes.keys.map { |key| key.to_s }
    end

    def keys_and_values
      attributes.map { |key, value| (key.to_s + ': ' + key.to_s) }.join(", ")
    end

    def hexagon_name
      Dir.pwd.split('/').last
    end

    def module_name
      options[:name].camelize
    end

    def hexagon_module_name
      hexagon_name.camelize
    end

    def attribute_names
      attributes.keys.map { |key| ':' + key.to_s }.join ", "
    end

    def attribute_param_names
      attributes.keys.map { |key| key.to_s + ':' }.join ", "
    end

    def attributes
      options[:attributes].merge(id: 'integer')
    end
  end
end

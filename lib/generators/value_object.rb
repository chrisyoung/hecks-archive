class Domain
  class ValueObject < Thor::Group
    include Thor::Actions

    class_option :aggregate_name,
                 aliases: "-m",
                 desc:    "the name of the module to create the use case in"
    class_option :attributes,
                 aliases: "-a",
                 type:    :hash,
                 desc:    "attributes for the value object"

    argument :name

    def self.source_root
      File.dirname(__FILE__)
    end

    def create_value_object_folder
      directory('templates/value_object', ".")
    end

    private

    def attribute_names
      attributes.keys.map { |key| ':' + key.to_s }.join ", "
    end

    def keys_and_values
      attributes.map { |key, value| (key.to_s + ': ' + key.to_s) }.join(", ")
    end

    def attribute_param_names
      attributes.keys.map { |key| key.to_s + ':' }.join ", "
    end

    def attribute_names_as_strings
      attributes.keys.map { |key| key.to_s }
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

    def module_name
      name.camelize
    end

    def attributes
      options[:attributes]
    end
  end
end

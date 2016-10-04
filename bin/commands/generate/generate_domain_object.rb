# class GenerateDomainObject < Thor::Group
#   include Thor::Actions
#
# end

class GenerateDomainObject < Thor::Group
  include Thor::Actions

  class_option :head_name,   :aliases => "-h", desc: "the name of the aggregate head"
  class_option :attributes,  :aliases => "-a", type: :hash, desc: "attributes for the aggregate head"
  class_option :name,        :aliases => "-n", desc: "attributes for the aggregate head"
  class_option :type,        :aliases => "-t", desc: "The type of domain object you want to create"
  class_option :module_name, :aliases => "-m", desc: "Domain Module"

  def self.source_root
    File.dirname(__FILE__) + '/../../generators/templates/generate/domain'
  end

  def create_aggregate_folder
    directory("#{options[:type]}", '.')
  end

  private

  def name
    options[:name]
  end

  def camelized_name
    name.camelize
  end

  # Aliases
  def hexagon_module_name
    camelized_hexagon_name
  end

  def aggregate_name
    module_name
  end

  def aggregate_module_name
    camelized_module_name
  end

  def head_module_name
    camelized_head_name
  end

  def attributes
    options[:attributes]
  end

  def attribute_names
    attributes.keys
  end

  def attribute_param_names
    attribute_param_names_as_string
  end

  # Head Name
  def head_name
    options[:head_name]
  end

  def camelized_head_name
    head_name.camelize
  end

  # Module Name
  def module_name
    options[:module_name]
  end

  def camelized_module_name
    module_name.camelize
  end

  def keys_and_values
    attributes.map { |key, value| (key.to_s + ': ' + key.to_s) }.join(", ")
  end

  # Hexagon
  def hexagon_name
    Dir.pwd.split('/').last
  end

  def camelized_hexagon_name
    hexagon_name.camelize
  end

  # Attributes
  def attribute_names_as_strings
    attributes.keys.map { |key| key.to_s }.join(", ")
  end

  def attributes_as_string
    attributes.keys.map { |key| ':' + key.to_s }.join ", "
  end

  def attribute_param_names_as_string
    attributes.keys.map { |key| key.to_s + ':' }.join ", "
  end

  def attributes
    options[:attributes].merge(id: 'integer')
  end
end

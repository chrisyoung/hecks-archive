# frozen_string_literal: true
# class GenerateDomainObject < Thor::Group
#   include Thor::Actions
#
# end

class GenerateDomainObject < Thor::Group
  include Thor::Actions

  class_option :head_name,   aliases: '-h', desc: 'the name of the aggregate head'
  class_option :attributes,  aliases: '-a', type: :hash, desc: 'attributes for the aggregate head'
  class_option :name,        aliases: '-n', desc: 'attributes for the aggregate head'
  class_option :type,        aliases: '-t', desc: 'The type of domain object you want to create'
  class_option :module_name, aliases: '-m', desc: 'Domain Module'

  def self.source_root
    File.dirname(__FILE__) + '/../../../generators/templates/generate/domain'
  end

  def create_aggregate_folder
    directory(options[:type].to_s, '.')
  end

  private

  def name
    options[:name]
  end

  def camelized_name
    name.camelize
  end

  # Aliases
  def aggregate_name
    module_name
  end

  def aggregate_module_name
    camelized_module_name
  end

  def head_module_name
    camelized_head_name
  end

  def attribute_names
    attributes.keys
  end

  def attribute_names_without_id
    attributes_without_id.keys
  end


  def attribute_param_names
    attribute_param_names_as_string
  end

  def attribute_param_names_without_id
    attribute_param_names_as_string_without_id
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

  def keys_and_values_without_id
    attributes_without_id.map { |key, _value| (key.to_s + ': ' + key.to_s) }.join(', ')
  end

  def keys_and_values
    attributes.map { |key, _value| (key.to_s + ': ' + key.to_s) }.join(', ')
  end

  # Domain
  def domain_name
    Dir.pwd.split('/').last
  end

  def assignment_template(attributes)
    attributes.map do |name, type|
      "@#{name.to_s} = #{name.to_s}"
    end.join("\n")
  end

  def parse_type(type)
    type.delete('[').delete(']')
  end

  def camelized_domain_name
    domain_name.camelize
  end

  # Attributes
  def attribute_names_as_strings
    attributes.keys.map(&:to_s).join(', ')
  end

  def attributes_as_string
    attributes.keys.map { |key| ':' + key.to_s }.join ', '
  end

  def attributes_without_id_as_string
    attributes_without_id.keys.map { |key| ':' + key.to_s }.join ', '
  end

  def required_attributes_as_string
    (attributes.keys - [:id]).map { |key| ':' + key.to_s }.join ', '
  end

  def attribute_param_names_as_string
    attributes.keys.map { |key| key.to_s + ':' }.join ', '
  end

  def attribute_param_names_as_string_without_id
    attributes_without_id.keys.map { |key| key.to_s + ':' }.join ', '
  end

  def attributes
    options[:attributes].merge(id: 'integer')
  end

  def attributes_without_id
    options[:attributes]
  end
end

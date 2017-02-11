# frozen_string_literal: true

class GenerateDomainObject < Thor::Group; end

require_relative "generate_domain_object/assignment_template"
require_relative "generate_domain_object/option_formatter"

class GenerateDomainObject
  include Thor::Actions

  class_option :head_name,   aliases: '-h', desc: 'the name of the aggregate head'
  class_option :attributes,  aliases: '-a', type: :array, desc: 'attributes for the aggregate head'
  class_option :name,        aliases: '-n', desc: 'attributes for the aggregate head'
  class_option :type,        aliases: '-t', desc: 'The type of domain object you want to create'
  class_option :module_name, aliases: '-m', desc: 'Domain Module'
  class_option :referenced_entity, aliases: '-r', desc: 'Referenced Entity'

  def self.source_root
    File.dirname(__FILE__) + '/../../../generators/templates/generate/domain'
  end

  def create_aggregate_folder
    directory(options[:type].to_s, '.')
  end

  private

  def assignment_template(attributes)
    AssignmentTemplate.new(attributes).render
  end

  def option_format(format, include_id: false)
    OptionFormatter.new(options[:attributes]).call(format, include_id: include_id)
  end

  def head_name
    options[:head_name]
  end

  def name
    options[:name]
  end

  def file_name
    name.underscore
  end

  def attribute_names_without_id
    attributes_without_id.map(&:name)
  end

  def module_name
    options[:module_name]
  end

  def domain_name
    Dir.pwd.split('/').last
  end

  def attributes_without_id_as_string
    attributes_without_id.map { |attribute| ':' + Hecks::DomainBuilder::Attribute.new(attribute).name }.join ', '
  end

  def attributes
    options[:attributes] + ['id:value']
  end

  def attributes_without_id
    options[:attributes]
  end
end

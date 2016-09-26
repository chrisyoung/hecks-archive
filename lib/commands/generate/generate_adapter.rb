class GenerateAdapter < Thor::Group
  include Thor::Actions
  class_option :type, aliases: "-t", desc: "type of adapter", required: true
  class_option :module_name, aliases: "-m", desc: "Module Name"
  class_option :attributes,  aliases: "-a", type: :hash, desc: "required attributes will be validated by a schema"

  def self.source_root
    File.dirname(__FILE__) + '/../../templates/generate/adapters'
  end

  def run_generator
    directory("#{options[:type]}", ".")
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

  def attributes
    options[:attributes]
  end

  def aggregate_module_name
    options[:module_name].camelize
  end
end

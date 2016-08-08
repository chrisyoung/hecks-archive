class HecksValueObject < Thor::Group
  include Thor::Actions

  class_option :module_name, aliases: "-m", desc: "the name of the module to create the use case in"
  class_option :attributes,  aliases: "-a", type: :hash, desc: "attributes for the value object"

  argument :name

  def self.source_root
    File.dirname(__FILE__)
  end

  def create_value_object_folder
    directory('../templates/value_object', ".")
  end


  def module_name
    options[:module_name]
  end

  def attributes
    options[:attributes]
  end
end

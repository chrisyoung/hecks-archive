class HecksValueObject < Thor::Group
  include Thor::Actions

  argument :hexagon_name
  argument :module_name
  argument :name
  argument :attributes, type: :hash

  class_option :test_framework, :default => :rspec

  def self.source_root
    File.dirname(__FILE__)
  end

  def create_value_object
    template('templates/value_object.tt', "lib/#{hexagon_name}/domain/#{module_name}/#{name}.rb")
  end

  def create_app_spec_file
    template('templates/spec/value_object.tt', "lib/#{hexagon_name}/spec/domain/#{module_name}/#{name}_spec.rb")
  end
end

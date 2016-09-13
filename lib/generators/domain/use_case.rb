class HecksUseCase < Thor::Group
  include Thor::Actions

  class_option :module_name, :aliases => "-m", :desc => "the name of the module to create the use case in"
  argument :name

  def self.source_root
    File.dirname(__FILE__)
  end

  def create_value_object
    template('templates/use_case.tt', "lib/#{hexagon_name}/commands/#{name}.rb")
  end

  def create_app_spec_file
    template('templates/spec/use_case.tt', "lib/#{hexagon_name}/spec/commands/#{name}_spec.rb")
  end
end

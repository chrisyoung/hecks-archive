class HecksUseCase < Thor::Group
  include Thor::Actions

  argument :hexagon_name
  argument :module_name
  argument :name


  def self.source_root
    File.dirname(__FILE__)
  end

  def create_value_object
    template('templates/use_case.tt', "lib/#{hexagon_name}/use_cases/#{name}.rb")
  end

  def create_app_spec_file
    template('templates/spec/use_case.tt', "lib/#{hexagon_name}/spec/use_cases/#{name}_spec.rb")
  end
end

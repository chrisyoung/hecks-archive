class GeneratePackage < Thor::Group
  include Thor::Actions
  # desc 'package','Package as a aws lamda function'
  def self.source_root
    File.dirname(__FILE__) + '/templates/'
  end

  def create_package_folder
    directory('packages', './packages')
  end

  def package
    # exec 'hecks_package'
  end
end

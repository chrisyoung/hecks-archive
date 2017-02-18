class GenerateBinaryPackage < Thor::Group
  include Thor::Actions

  def self.source_root
    File.dirname(__FILE__) + '/templates/packages'
  end

  def create_package_folder
    directory('binary', './packages/binary')
  end

  def domain_name
    Dir.pwd.split('/').last
  end

  def package
    exec 'hecks_package_binary'
  end
end

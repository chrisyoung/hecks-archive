class GenerateLambdaPackage < Thor::Group
  include Thor::Actions

  def self.source_root
    File.dirname(__FILE__) + '/templates/packages'
  end

  def create_package_folder
    directory('lambda', './packages/lambda')
  end

  def domain_name
    Dir.pwd.split('/').last
  end

  def package
    exec 'hecks_package_lambda'
  end
end

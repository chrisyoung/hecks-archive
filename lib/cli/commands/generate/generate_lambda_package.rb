class GenerateLambdaPackage < Thor::Group
  include Thor::Actions

  def self.source_root
    File.dirname(__FILE__) + '/templates'
  end

  def create_package_folder
    directory('lambda_package', './packages/lambda')
  end

  def domain_name
    Dir.pwd.split('/').last
  end

  def create_package_folder
    run('npm install -g serverless')
    run("cp -r packages/binary/build/osx packages/lambda/#{domain_name}")
  end
end

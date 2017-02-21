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
    run("rm -rf packages/lambda")
    run('npm install -g serverless')
    run('serverless create --template aws-nodejs --path ./packages/lambda')
    run('npm install serverless-offline --save-dev -g')
  end
end

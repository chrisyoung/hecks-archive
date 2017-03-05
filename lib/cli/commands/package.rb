require_relative 'package/generate_lambda_package'
require_relative 'package/generate_binary_package'

class Package < Thor
  desc 'lambda', 'lambda'
  register      GenerateLambdaPackage,
                'lambda',
                'lambda',
                'Generate Lambda Package'

  desc 'binary', 'binary'
  register      GenerateBinaryPackage,
                'binary',
                'binary',
                'Generate Binary Package'
end

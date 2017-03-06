class Package < Thor
  desc 'lambda', 'lambda'
  register      Hecks::Packager::CLI::GenerateLambdaPackage,
                'lambda',
                'lambda',
                'Generate Lambda Package'

  desc 'binary', 'binary'
  register      Hecks::Packager::CLI::GenerateBinaryPackage,
                'binary',
                'binary',
                'Generate Binary Package'
end

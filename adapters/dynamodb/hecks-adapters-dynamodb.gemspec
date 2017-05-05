require 'Date'
version = ENV['HECKS_VERSION']

Gem::Specification.new do |s|
  s.name        = 'hecks-adapters-dynamodb'
  s.homepage    = "https://github.com/chrisyoung/hecks"
  s.version     = version
  s.date        = Date.today
  s.summary     = "Drive DynamoDB with Domains created with HecksDomain"
  s.description = "Hecks DynamoDB Database"
  s.authors     = ["Chris Young"]
  s.email       = 'chris@example.com'
  s.files       = Dir["lib/**/*"]
  s.license     = 'MIT'

  s.add_runtime_dependency 'aws-sdk', '~> 2'
end

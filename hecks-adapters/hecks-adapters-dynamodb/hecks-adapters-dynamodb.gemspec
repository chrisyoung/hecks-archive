require 'Date'
Gem::Specification.new do |s|
  version = File.read("../../hecks-application/lib/Version").gsub("\n", '')
  s.name        = 'hecks-adapters-dynamodb'
  s.homepage    = "https://github.com/chrisyoung/hecks-domain"
  s.version     = version
  s.date        = Date.today
  s.summary     = "Drive DynamoDB with Domains created with Hecks::Domain"
  s.description = "Hecks DynamoDB Database"
  s.authors     = ["Chris Young"]
  s.email       = 'chris@example.com'
  s.files       = Dir["lib/**/*"]
  s.license     = 'MIT'

  s.add_runtime_dependency 'aws-sdk', '~> 2'
end

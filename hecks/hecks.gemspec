require 'Date'
Gem::Specification.new do |s|
  version = File.read("../hecks-application/lib/Version").gsub("\n", '')
  s.name        = 'hecks'
  s.homepage    = "https://github.com/chrisyoung/heckson"
  s.version     = version
  s.date        = Date.today
  s.summary     = "DDD and Hexagonal Code Generators"
  s.description = "Make the Domain the center of your programming world"
  s.authors     = ["Chris Young"]
  s.email       = 'chris@example.com'
  s.files       = Dir["lib/**/*"]
  s.license     = 'MIT'

  s.add_runtime_dependency 'hecks-application', "=#{version}"
  s.add_runtime_dependency 'hecks-domain', "=#{version}"
  s.add_runtime_dependency 'hecks-adapters', "=#{version}"
  s.add_runtime_dependency 'hecks-adapters-sql-database', "=#{version}"
  s.add_runtime_dependency 'hecks-adapters-resource-server', "=#{version}"
  s.add_runtime_dependency 'hecks-adapters-dynamodb', "=#{version}"
  s.add_runtime_dependency 'thor', "~>0.10"

  s.add_development_dependency "codeclimate-test-reporter", "~> 1.0"
  s.add_development_dependency 'guard-rspec', "~>4.7"
  s.add_development_dependency 'simplecov', '~>0.12'
  s.add_development_dependency 'rack-test', '~>0.6'
  s.add_development_dependency 'pry', '~>0.10'
  s.add_development_dependency 'vcr'
  s.add_development_dependency 'webmock'


  s.executables << 'hecks'
  s.executables << 'hecks_console'
end

Gem::Specification.new do |s|
  s.name        = 'hecks'
  s.homepage    = "https://github.com/chrisyoung/heckson"
  s.version     = '0.0.5'
  s.date        = '2016-09-12'
  s.summary     = "DDD and Hexagonal Code Generators"
  s.description = "Make the Domain the center of your programming world"
  s.authors     = ["Chris Young"]
  s.email       = 'chris@example.com'
  s.files       = Dir["lib/**/*"]
  s.license     = 'MIT'

  s.add_runtime_dependency 'thor', "~>0.19"
  s.add_runtime_dependency 'sinatra'
  s.add_runtime_dependency 'json-schema'
  s.add_runtime_dependency 'activesupport'

  s.add_development_dependency "codeclimate-test-reporter", "~> 1.0.0"
  s.add_development_dependency 'guard-rspec'
  s.add_development_dependency 'simplecov'
  s.add_development_dependency 'rack-test'
  s.add_development_dependency 'pry'

  s.executables << 'hecks'
  s.executables << 'hecks_console'
end

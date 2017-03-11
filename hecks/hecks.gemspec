require 'Date'
Gem::Specification.new do |s|
  s.name        = 'hecks'
  s.homepage    = "https://github.com/chrisyoung/heckson"
  s.version     = File.read("Version").gsub("\n", '')
  s.date        = Date.today
  s.summary     = "DDD and Hexagonal Code Generators"
  s.description = "Make the Domain the center of your programming world"
  s.authors     = ["Chris Young"]
  s.email       = 'chris@example.com'
  s.files       = Dir["lib/**/*"]
  s.license     = 'MIT'

  s.add_runtime_dependency 'hecks-application'
  s.add_runtime_dependency 'hecks-domain'
  s.add_runtime_dependency 'hecks-cli'
  s.add_runtime_dependency 'hecks-packager'
  s.add_runtime_dependency 'hecks-adapters'
  s.add_runtime_dependency 'activesupport', "~>5.0"
  s.add_runtime_dependency 'thor', "~>0.19"

  s.add_development_dependency "codeclimate-test-reporter", "~> 1.0"
  s.add_development_dependency 'guard-rspec', "~>4.7"
  s.add_development_dependency 'simplecov', '~>0.12'
  s.add_development_dependency 'rack-test', '~>0.6'
  s.add_development_dependency 'pry', '~>0.10'

  s.executables << 'hecks'
  s.executables << 'hecks_console'
end

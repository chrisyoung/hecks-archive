require 'Date'
Gem::Specification.new do |s|
  version = File.read("../../Version").gsub("\n", '')
  s.name        = 'hecks-adapters-resource-server'
  s.homepage    = "https://github.com/chrisyoung/hecks-domain"
  s.version     = version
  s.date        = Date.today
  s.summary     = "DDD and Hexagonal Code Generators"
  s.description = "Make the Domain the center of your programming world"
  s.authors     = ["Chris Young"]
  s.email       = 'chris@example.com'
  s.files       = Dir["lib/**/*"]
  s.license     = 'MIT'

  s.add_runtime_dependency 'hecks-application', "=#{version}"
  s.add_runtime_dependency 'sinatra', '~> 1.4'
  s.add_runtime_dependency 'rack-test', '~> 0.6'
end

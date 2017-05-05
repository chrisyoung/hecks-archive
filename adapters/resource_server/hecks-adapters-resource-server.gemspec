require 'Date'
version = ENV['HECKS_VERSION']
Gem::Specification.new do |s|
  s.name        = 'hecks-adapters-resource-server'
  s.homepage    = "https://github.com/chrisyoung/hecks-domain"
  s.version     = version
  s.date        = Date.today
  s.summary     = "Drive a resourceful web server with Domains created using HecksDomain generators"
  s.description = "Hecks HTTP Resource Server"
  s.authors     = ["Chris Young"]
  s.email       = 'chris@example.com'
  s.files       = Dir["lib/**/*"]
  s.license     = 'MIT'

  s.add_runtime_dependency 'hecks-application', "=#{version}"
  s.add_runtime_dependency 'sinatra', '~> 1.4'
  s.add_runtime_dependency 'rack-test', '~> 0.6'
end

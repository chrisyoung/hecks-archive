require 'Date'
version = ENV['HECKS_VERSION']
Gem::Specification.new do |s|
  s.name        = 'hecks-application'
  s.homepage    = "https://github.com/chrisyoung/hecks-application"
  s.version     = version
  s.date        = Date.today
  s.summary     = "HecksApplication acts as an interface to Domains built with HecksDomain"
  s.description = "Hecks Application"
  s.authors     = ["Chris Young"]
  s.email       = 'chris@example.com'
  s.files       = Dir["lib/**/*"]
  s.license     = 'MIT'

  s.add_runtime_dependency 'hecks-domain', "=#{version}"
  s.add_runtime_dependency 'hecks-memory-database', "=#{version}"
end

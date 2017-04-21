require 'Date'
Gem::Specification.new do |s|
  version = File.read("lib/Version").gsub("\n", '')
  s.name        = 'hecks-application'
  s.homepage    = "https://github.com/chrisyoung/hecks-application"
  s.version     = version
  s.date        = Date.today
  s.summary     = "HecksApplication acts as an interface to Domains built with Hecks::Domain"
  s.description = "Hecks Application"
  s.authors     = ["Chris Young"]
  s.email       = 'chris@example.com'
  s.files       = Dir["lib/**/*"]
  s.license     = 'MIT'

  s.add_runtime_dependency 'hecks-domain', "=#{version}"
  s.add_runtime_dependency 'hecks-events', "=#{version}"
  s.add_runtime_dependency 'hecks-logger', "=#{version}"
  s.add_runtime_dependency 'hecks-validator', "=#{version}"
  s.add_runtime_dependency 'hecks-memory-database', "=#{version}"
end

require 'Date'
Gem::Specification.new do |s|
  version = File.read("../hecks-application/lib/Version").gsub("\n", '')
  s.name        = 'hecks-adapters'
  s.homepage    = "https://github.com/chrisyoung/heckson"
  s.version     = version
  s.date        = Date.today
  s.summary     = "Adapts various technologies to Domains built with Hecks::Domain generators"
  s.description = "Hecks Adapters"
  s.authors     = ["Chris Young"]
  s.email       = 'chris@example.com'
  s.files       = Dir["lib/**/*"]
  s.license     = 'MIT'

  s.add_runtime_dependency 'hecks-adapters-resource-server', "=#{version}"
  s.add_runtime_dependency 'hecks-adapters-sql-database', "=#{version}"
end

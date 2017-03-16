require 'Date'
Gem::Specification.new do |s|
  version = File.read("../../hecks-application/lib/Version").gsub("\n", '')
  s.name        = 'hecks-adapters-sql-database'
  s.homepage    = "https://github.com/chrisyoung/hecks-domain"
  s.version     = version
  s.date        = Date.today
  s.summary     = "Drive a SQL Database with Domains created with Hecks::Domain"
  s.description = "Hecks SQL Database"
  s.authors     = ["Chris Young"]
  s.email       = 'chris@example.com'
  s.files       = Dir["lib/**/*"]
  s.license     = 'MIT'

  s.add_runtime_dependency 'hecks-application', "=#{version}"
  s.add_runtime_dependency 'mysql2', '=0.3.18'
  s.add_runtime_dependency 'sequel', '~> 4.43'
end
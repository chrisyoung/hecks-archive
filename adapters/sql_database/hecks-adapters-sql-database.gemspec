require 'Date'
version = ENV['HECKS_VERSION']
Gem::Specification.new do |s|
  s.name        = 'hecks-adapters-sql-database'
  s.homepage    = "https://github.com/chrisyoung/hecks-domain"
  s.version     = version
  s.date        = Date.today
  s.summary     = "Drive a SQL Database with Domains created with HecksDomain"
  s.description = "Hecks SQL Database"
  s.authors     = ["Chris Young"]
  s.email       = 'chris@example.com'
  s.files       = Dir["lib/**/*"]
  s.license     = 'MIT'

  s.add_runtime_dependency 'hecks-application', "=#{version}"
  s.add_runtime_dependency 'mysql2', '=0.3.18'
  s.add_runtime_dependency 'sequel', '~> 4.43'
end

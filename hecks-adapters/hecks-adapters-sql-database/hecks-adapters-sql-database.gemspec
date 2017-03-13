require 'Date'
Gem::Specification.new do |s|
  s.name        = 'hecks-adapters-sql-database'
  s.homepage    = "https://github.com/chrisyoung/hecks-domain"
  s.version     = File.read("Version").gsub("\n", '')
  s.date        = Date.today
  s.summary     = "DDD and Hexagonal Code Generators"
  s.description = "Make the Domain the center of your programming world"
  s.authors     = ["Chris Young"]
  s.email       = 'chris@example.com'
  s.files       = Dir["lib/**/*"]
  s.license     = 'MIT'

  s.add_runtime_dependency 'hecks-application', '~> 0.0'
  s.add_runtime_dependency 'mysql2', '~> 0.4'
  s.add_runtime_dependency 'sequel', '~> 4.43'
end

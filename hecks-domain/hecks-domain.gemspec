require 'Date'
Gem::Specification.new do |s|
  s.name        = 'hecks-domain'
  s.homepage    = "https://github.com/chrisyoung/hecks-domain"
  s.version     = File.read("Version").gsub("\n", '')
  s.date        = Date.today
  s.summary     = "DDD and Hexagonal Code Generators"
  s.description = "Make the Domain the center of your programming world"
  s.authors     = ["Chris Young"]
  s.email       = 'chris@example.com'
  s.files       = Dir["lib/**/*"]
  s.license     = 'MIT'

  s.add_runtime_dependency 'hecks-adapters-sql-database', '~> 0.0'
end

require 'Date'
version = ENV['HECKS_VERSION']
Gem::Specification.new do |s|
  s.name        = 'hecks-memory-database'
  s.homepage    = "https://github.com/chrisyoung/hecks"
  s.version     = version
  s.date        = Date.today
  s.summary     = "The default 'in memory' database for Hecks applications"
  s.description = "Hecks Memory Database"
  s.authors     = ["Chris Young"]
  s.email       = 'chris@example.com'
  s.files       = Dir["lib/**/*"]
  s.license     = 'MIT'
end

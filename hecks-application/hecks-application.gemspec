require 'Date'
Gem::Specification.new do |s|
  s.name        = 'hecks-application'
  s.homepage    = "https://github.com/chrisyoung/hecks-application"
  s.version     = File.read("../Version").gsub("\n", '')
  s.date        = Date.today
  s.summary     = "DDD and Hexagonal Code Generators"
  s.description = "Make the Domain the center of your programming world"
  s.authors     = ["Chris Young"]
  s.email       = 'chris@example.com'
  s.files       = Dir["lib/**/*"]
  s.license     = 'MIT'
end

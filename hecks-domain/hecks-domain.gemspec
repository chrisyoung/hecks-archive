require 'Date'
Gem::Specification.new do |s|
  version = File.read("../hecks-application/lib/Version").gsub("\n", '')
  s.name        = 'hecks-domain'
  s.homepage    = "https://github.com/chrisyoung/hecks-domain"
  s.version     = version
  s.date        = Date.today
  s.summary     = "Here be Domain Driven Design Generators and Builders"
  s.description = "Hecks Domain"
  s.authors     = ["Chris Young"]
  s.email       = 'chris@example.com'
  s.files       = Dir["lib/**/*"]
  s.license     = 'MIT'
end

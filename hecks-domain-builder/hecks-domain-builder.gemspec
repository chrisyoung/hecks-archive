require 'Date'
version = File.read("../hecks-application/lib/Version").gsub("\n", '')

Gem::Specification.new do |s|
  s.version     = version
  s.name        = 'hecks-domain-builder'
  s.homepage    = "https://github.com/chrisyoung/hecks"
  s.date        = Date.today
  s.summary     = "An api for introspecting your Domain"
  s.description = "Hecks Domain Builder - building domains since 2017"
  s.authors     = ["Chris Young"]
  s.email       = 'chris@example.com'
  s.files       = Dir["lib/**/*"]
  s.license     = 'MIT'
end

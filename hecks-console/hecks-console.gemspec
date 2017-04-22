require 'Date'
version = File.read("../hecks-application/lib/Version").gsub("\n", '')
Gem::Specification.new do |s|
  s.version     = version
  s.name        = 'hecks-console'
  s.homepage    = "https://github.com/chrisyoung/hecks"
  s.date        = Date.today
  s.summary     = "Gives you easy access to your domain in a Ruby console"
  s.description = "Hecks Console"
  s.authors     = ["Chris Young"]
  s.email       = 'chris@example.com'
  s.files       = Dir["lib/**/*"]
  s.license     = 'MIT'
end

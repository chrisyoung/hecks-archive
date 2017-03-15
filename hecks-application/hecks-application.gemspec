require 'Date'
Gem::Specification.new do |s|
  s.name        = 'hecks-application'
  s.homepage    = "https://github.com/chrisyoung/hecks-application"
  s.version     = File.read("lib/Version").gsub("\n", '')
  s.date        = Date.today
  s.summary     = "Hecks::Application understands things and acts as an interface to Domains built with Hecks::Domain"
  s.description = "Make the Domain the center of your programming world"
  s.authors     = ["Chris Young"]
  s.email       = 'chris@example.com'
  s.files       = Dir["lib/**/*"]
  s.license     = 'MIT'
end

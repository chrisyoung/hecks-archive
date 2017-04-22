require 'Date'
version = File.read("../hecks-application/lib/Version").gsub("\n", '')

Gem::Specification.new do |s|
  s.name        = 'hecks-cli'
  s.homepage    = "https://github.com/chrisyoung/hecks"
  s.version     = version
  s.date        = Date.today
  s.summary     = "Commands for generating your domains"
  s.description = "Hecks Command Line Interface"
  s.authors     = ["Chris Young"]
  s.email       = 'chris@example.com'
  s.files       = Dir["lib/**/*"]
  s.license     = 'MIT'

  s.add_runtime_dependency 'hecks-adapters-resource-server', "=#{version}"
end

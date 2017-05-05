require 'Date'
puts `pwd`
version = ENV['HECKS_VERSION']
Gem::Specification.new do |s|
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

  s.add_runtime_dependency 'hecks-domain-builder', "=#{version}"
  s.add_runtime_dependency 'activesupport', '~>5.0'
  s.add_runtime_dependency 'thor', '~>0.19'
end

require 'Date'
version = ENV['HECKS_VERSION']

Gem::Specification.new do |s|
  s.name        = 'hecks-plugins-json-validator'
  s.homepage    = "https://github.com/chrisyoung/hecks"
  s.version     = version
  s.date        = Date.today
  s.summary     = "Advanced Domain Validations Based on JSON Schema http://json-schema.org/"
  s.description = "Hecks JSON Schema Validations"
  s.authors     = ["Chris Young"]
  s.email       = 'chris@example.com'
  s.files       = Dir["lib/**/*"]
  s.license     = 'MIT'

  s.add_runtime_dependency 'json-schema', '~> 2.5'
end

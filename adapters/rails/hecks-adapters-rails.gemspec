require 'Date'
version = ENV['HECKS_VERSION']
Gem::Specification.new do |s|
  s.name        = 'hecks-adapters-rails'
  s.homepage    = "https://github.com/chrisyoung/hecks"
  s.version     = version
  s.date        = Date.today
  s.summary     = "Helpers to make it seamless to use Hecks in Rails"
  s.description = "Hecks Rails Helpers"
  s.authors     = ["Chris Young"]
  s.email       = 'chris@example.com'
  s.files       = Dir["lib/**/*"]
  s.license     = 'MIT'
end

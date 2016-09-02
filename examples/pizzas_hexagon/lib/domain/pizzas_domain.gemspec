Gem::Specification.new do |s|
  s.name        = 'pizzas_domain'
  s.version     = '0.0.0'
  s.date        = '2016-08-30'
  s.summary     = "Pizza Domain"
  s.description = "A domain library"
  s.authors     = ["Chris Young"]
  s.email       = 'chris@example.com'
  s.files       = Dir["lib/**/*"]
  s.license     = 'MIT'

  s.add_dependency 'rspec'
  s.add_dependency 'guard-rspec'
  s.add_dependency 'simplecov'
end

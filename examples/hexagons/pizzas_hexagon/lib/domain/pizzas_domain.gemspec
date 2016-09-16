Gem::Specification.new do |s|
  s.name        = 'pizzas_domain'
  s.version     = '0.0.0'
  s.homepage    = 'https://github.com/chrisyoung/heckson'
  s.date        = '2016-08-30'
  s.summary     = "Pizza Domain"
  s.description = "A domain library"
  s.authors     = ["Chris Young"]
  s.email       = 'chris@example.com'
  s.files       = Dir["lib/**/*"]
  s.license     = 'MIT'

  s.add_development_dependency 'rspec',       '~> 3.5'
  s.add_development_dependency 'guard-rspec', '~> 4.7'
  s.add_development_dependency 'simplecov',   '~> 0.12'
end

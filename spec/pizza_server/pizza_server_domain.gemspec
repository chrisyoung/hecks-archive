Gem::Specification.new do |s|
  s.name        = 'pizza_server_domain'
  s.version     = '0.0.0'
  s.authors     = ['Who are you?']
  # s.homepage    = ''
  # s.date        = ''
  # s.description = ""

  # s.email       = ''
  # s.license     = ''
  s.summary     = "PizzaServerHexagon Domain"
  s.files       = Dir["lib/**/*"]

  s.add_development_dependency 'rspec',       '~> 3.5'
  s.add_development_dependency 'guard-rspec', '~> 4.7'
  s.add_development_dependency 'simplecov',   '~> 0.12'
end

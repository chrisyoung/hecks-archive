Gem::Specification.new do |s|
  s.name        = 'pizza_server_demo_hexagon'
  s.version     = '0.0.0'
  s.files       = Dir["lib/**/*"]
  s.license     = 'MIT'
  s.authors     = ["Who are you?"]
  s.summary     = "What is it?"

#  s.homepage    = ""
#  s.date        = ''
#  s.email       = ''

  s.add_development_dependency 'rspec', "~> 3.5"
  s.add_development_dependency 'guard-rspec', "~> 4.7"
  s.add_development_dependency 'simplecov', "~> 0.12"
  s.add_development_dependency 'pry', "~> 0.10"
  s.add_development_dependency 'rack-test', '~> 0.6.3'

  # s.add_runtime_dependency 'mysql2'
  s.add_runtime_dependency 'dry-validation', '~> 0.9'
  s.add_runtime_dependency 'activerecord', "~> 5.0"
  s.add_runtime_dependency 'pizza_server_demo_domain', "~> 0.0"
  s.add_runtime_dependency 'sinatra', "~> 1.4"
  s.add_runtime_dependency 'json', "~> 2.0"
end
Gem::Specification.new do |s|
  s.name        = 'hecks_resource_server'
  s.version     = '0.0.0'
  s.date        = '2016-09-01'
  s.summary     = "The resource server works with Hecks domains to server up CRUD methods over HTTP"
  s.description = "CRUD Server for Hecks Domains"
  s.homepage    = "https://github.com/chrisyoung/heckson"
  s.authors     = ["Chris Young"]
  s.email       = 'chris@example.com'
  s.files       = Dir["lib/**/*"]
  s.license     = 'MIT'

  s.add_runtime_dependency 'sinatra'
  s.add_runtime_dependency 'thin'
  s.add_development_dependency 'pry'
end

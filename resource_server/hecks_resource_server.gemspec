Gem::Specification.new do |s|
  s.name        = 'hecks_resource_server'
  s.version     = '0.0.0'
  s.date        = '2016-09-01'
  s.summary     = "CRUD Server for Hecks Domains"
  s.description = "CRUD Server for Hecks Domains"
  s.authors     = ["Chris Young"]
  s.email       = 'chris@example.com'
  s.files       = Dir["lib/**/*"]
  s.license     = 'MIT'

  s.add_dependency 'sinatra'
  s.add_dependency 'thin'
end

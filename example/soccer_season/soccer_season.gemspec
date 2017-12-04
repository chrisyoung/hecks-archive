Gem::Specification.new do |s|
  s.name        = 'soccer_season'
  s.homepage    = ""
  s.version     = File.read('Version').gsub("\n", '')
  s.date        = '2016-09-12'
  s.summary     = "Summary"
  s.description = "Description"
  s.authors     = ["Author"]
  s.email       = 'email@example.com'
  s.files       = Dir["lib/**/*"] + ['Domain']
  s.license     = 'MIT'
end

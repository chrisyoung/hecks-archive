# -*- encoding: utf-8 -*-
# stub: hecks 0.0.4 ruby lib

Gem::Specification.new do |s|
  s.name = "hecks"
  s.version = "0.0.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Chris Young"]
  s.date = "2016-09-12"
  s.description = "Make the Domain the center of your programming world"
  s.email = "chris@example.com"
  s.executables = ["hecks", "hecks_console"]
  s.files = ["bin/hecks", "bin/hecks_console"]
  s.homepage = "https://github.com/chrisyoung/heckson"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.4.8"
  s.summary = "DDD and Hexagonal Code Generators"

  s.installed_by_version = "2.4.8" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<thor>, ["~> 0.19"])
      s.add_runtime_dependency(%q<sinatra>, [">= 0"])
      s.add_runtime_dependency(%q<json-schema>, [">= 0"])
      s.add_runtime_dependency(%q<activesupport>, [">= 0"])
      s.add_runtime_dependency(%q<pry>, [">= 0"])
      s.add_development_dependency(%q<codeclimate-test-reporter>, ["~> 1.0.0"])
      s.add_development_dependency(%q<guard-rspec>, [">= 0"])
      s.add_development_dependency(%q<simplecov>, [">= 0"])
      s.add_development_dependency(%q<rack-test>, [">= 0"])
    else
      s.add_dependency(%q<thor>, ["~> 0.19"])
      s.add_dependency(%q<sinatra>, [">= 0"])
      s.add_dependency(%q<json-schema>, [">= 0"])
      s.add_dependency(%q<activesupport>, [">= 0"])
      s.add_dependency(%q<pry>, [">= 0"])
      s.add_dependency(%q<codeclimate-test-reporter>, ["~> 1.0.0"])
      s.add_dependency(%q<guard-rspec>, [">= 0"])
      s.add_dependency(%q<simplecov>, [">= 0"])
      s.add_dependency(%q<rack-test>, [">= 0"])
    end
  else
    s.add_dependency(%q<thor>, ["~> 0.19"])
    s.add_dependency(%q<sinatra>, [">= 0"])
    s.add_dependency(%q<json-schema>, [">= 0"])
    s.add_dependency(%q<activesupport>, [">= 0"])
    s.add_dependency(%q<pry>, [">= 0"])
    s.add_dependency(%q<codeclimate-test-reporter>, ["~> 1.0.0"])
    s.add_dependency(%q<guard-rspec>, [">= 0"])
    s.add_dependency(%q<simplecov>, [">= 0"])
    s.add_dependency(%q<rack-test>, [">= 0"])
  end
end

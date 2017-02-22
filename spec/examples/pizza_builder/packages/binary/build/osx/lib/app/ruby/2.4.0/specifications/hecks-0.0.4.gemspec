# -*- encoding: utf-8 -*-
# stub: hecks 0.0.4 ruby lib

Gem::Specification.new do |s|
  s.name = "hecks".freeze
  s.version = "0.0.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Chris Young".freeze]
  s.date = "2016-09-12"
  s.description = "Make the Domain the center of your programming world".freeze
  s.email = "chris@example.com".freeze
  s.executables = ["hecks".freeze, "hecks_console".freeze]
  s.files = ["bin/hecks".freeze, "bin/hecks_console".freeze]
  s.homepage = "https://github.com/chrisyoung/heckson".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "2.6.6".freeze
  s.summary = "DDD and Hexagonal Code Generators".freeze

  s.installed_by_version = "2.6.6" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<thor>.freeze, ["~> 0.19"])
      s.add_runtime_dependency(%q<sinatra>.freeze, [">= 0"])
      s.add_runtime_dependency(%q<json-schema>.freeze, [">= 0"])
      s.add_runtime_dependency(%q<activesupport>.freeze, [">= 0"])
      s.add_runtime_dependency(%q<pry>.freeze, [">= 0"])
      s.add_development_dependency(%q<codeclimate-test-reporter>.freeze, ["~> 1.0.0"])
      s.add_development_dependency(%q<guard-rspec>.freeze, [">= 0"])
      s.add_development_dependency(%q<simplecov>.freeze, [">= 0"])
      s.add_development_dependency(%q<rack-test>.freeze, [">= 0"])
    else
      s.add_dependency(%q<thor>.freeze, ["~> 0.19"])
      s.add_dependency(%q<sinatra>.freeze, [">= 0"])
      s.add_dependency(%q<json-schema>.freeze, [">= 0"])
      s.add_dependency(%q<activesupport>.freeze, [">= 0"])
      s.add_dependency(%q<pry>.freeze, [">= 0"])
      s.add_dependency(%q<codeclimate-test-reporter>.freeze, ["~> 1.0.0"])
      s.add_dependency(%q<guard-rspec>.freeze, [">= 0"])
      s.add_dependency(%q<simplecov>.freeze, [">= 0"])
      s.add_dependency(%q<rack-test>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<thor>.freeze, ["~> 0.19"])
    s.add_dependency(%q<sinatra>.freeze, [">= 0"])
    s.add_dependency(%q<json-schema>.freeze, [">= 0"])
    s.add_dependency(%q<activesupport>.freeze, [">= 0"])
    s.add_dependency(%q<pry>.freeze, [">= 0"])
    s.add_dependency(%q<codeclimate-test-reporter>.freeze, ["~> 1.0.0"])
    s.add_dependency(%q<guard-rspec>.freeze, [">= 0"])
    s.add_dependency(%q<simplecov>.freeze, [">= 0"])
    s.add_dependency(%q<rack-test>.freeze, [">= 0"])
  end
end

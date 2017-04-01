require 'vcr'

VCR.configure do |config|
  config.cassette_library_dir = "spec/integration/http_interactions"
  config.hook_into :webmock
end

RSpec.configure do |config|
  config.before(:all) { |example| VCR.insert_cassette("cache") }
  config.after(:all) { |example| VCR.eject_cassette("cache") }
end

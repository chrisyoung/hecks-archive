require 'vcr'

VCR.configure do |config|
  config.cassette_library_dir = "spec/integration/http_interactions"
  config.hook_into :webmock
end

RSpec.configure do |config|
  puts "**WARNING** HTTP Connections are being cached.  See " + File.dirname(__FILE__) + '/integration_helper.rb'
  config.before(:all) { |example| VCR.insert_cassette("cache") }
  config.after(:all)  { |example| VCR.eject_cassette("cache") }
end

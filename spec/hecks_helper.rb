ENV['DATABASE_URL'] ||= 'mysql2://root:password@localhost/pizza_builder_test'
ENV['HECKS_ENVIRONMENT'] ||= 'test'

require_relative '../hecks/lib/hecks'
require_relative '../hecks-examples/pizza_builder/lib/pizza_builder'

RSpec.configure do |config|
  config.before(:example) { |a|
    if a.file_path.include?('integration')
      WebMock.allow_net_connect!
    end
  }

  config.after(:example) { |a|
    if a.file_path.include?('integration')
      WebMock.disable_net_connect!
    end
  }
end

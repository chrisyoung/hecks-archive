ENV['DATABASE_URL'] ||= 'mysql2://root:password@localhost/pizza_builder_test'
ENV['HECKS_ENVIRONMENT'] ||= 'test'

require_relative '../hecks/lib/hecks'
require_relative '../hecks-examples/pizza_builder/lib/pizza_builder'

RSpec.configure do |config|
  config.before(:all) do
    # client = Aws::DynamoDB::Client.new(region: 'us-east-1')
    # Hecks::Adapters::DynamoDB::Migrate.new(client: client, domain: PizzaBuilder).call
  end
end

RSpec.configure do |config|
  # config.expect_with :rspec do |expectations|
  #   expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  # end

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

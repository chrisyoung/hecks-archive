RSpec.configure do |config|
  config.after(:each) do
    Ph2.new.delete_all
  end
end

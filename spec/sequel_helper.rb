RSpec.configure do |c|
  c.around(:each) do |example|
    Hecks::Adapters::SQLDatabase::DB.transaction(:rollback=>:always, :auto_savepoint=>true){example.run}
  end
end

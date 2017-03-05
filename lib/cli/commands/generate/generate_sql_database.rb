class GenerateSQLDatabase < Thor::Group
  include Thor::Actions

  def self.source_root
    File.dirname(__FILE__) + '/templates/'
  end

  def create_sql_database_folder
    directory('sql_database/adapters', './adapters')
  end

  def bundle
    run 'bundle'
  end
end

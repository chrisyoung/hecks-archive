class GenerateSQLDatabase < Thor::Group
  include Thor::Actions

  def self.source_root
    File.dirname(__FILE__) + '/templates/'
  end

  def create_aggregate_folder
    directory('sql_database', '.')
  end

  def domain
    File.basename(Dir.getwd)
  end
end

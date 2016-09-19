class Adapter
  class SQLDatabase < Thor::Group
    include Thor::Actions

    def self.source_root
      File.dirname(__FILE__)
    end

    def create_folder
      directory('templates/sql_database', ".")
    end
  end
end

class GenerateSQLDatabase < Thor::Group
  include Thor::Actions

  def self.source_root
    File.dirname(__FILE__) + '/templates/'
  end

  def create_sql_database_folder
    directory('adapters', './adapters')
  end

  def bundle
    run 'bundle'
  end

  def generate_repositories
    load('Domain')

    Hecks::Adapters::Domain::SQLDatabase::Schema.factory(DOMAIN).tables.each do |table|
      @class_name = table.name.camelize
      template('repository.rb', './adapters/sql_database/repositories/' + table.name + '.rb')
    end
  end

  private

  def class_name
    @class_name
  end

  def domain_module_name
    DOMAIN.name.camelize
  end
end

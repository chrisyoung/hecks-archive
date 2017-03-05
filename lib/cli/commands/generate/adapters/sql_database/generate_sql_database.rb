
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
    DOMAIN.domain_modules.values.each do |domain_module|
      @class_name = domain_module.name.camelize
      template('repository.rb', './adapters/sql_database/repositories/' + domain_module.name.downcase + '.rb')
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

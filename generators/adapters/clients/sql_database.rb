class Hecks::Adapters::SQLDatabase < Thor::Group
  include Thor::Actions

  argument :hexagon_name
  argument :module_name
  argument :name

  class_option :test_framework, :default => :rspec

  def self.source_root
    File.dirname(__FILE__)
  end

  def models_path
    "app/models"
  end

  def repositories_path
    models_path + "/repositories"
  end

  def models_spec_path
    "spec/models"
  end

  def repositories_spec_path
    models_spec_path + "/repositories"
  end

  def create_sql_repository
    template('../templates/sql_repository.tt', repositories_path + "/#{name}.rb")
  end

  def create_sql_repository_spec_file
    template('../templates/spec/sql_repository.tt', repositories_spec_path + "/#{name}_spec.rb")
  end

  def create_active_record_model
    template('../templates/active_record_model.tt', models_path + "/#{name}.rb")
  end

  def create_active_record_model_spec
    template('../templates/spec/active_record_model.tt', models_spec_path + "/#{name}_spec.rb")
  end
end

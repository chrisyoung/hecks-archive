module Hecks
  module Domain
      module Adapters
      class SQLDatabase
        module CLI
          class GenerateSQLDatabase < Thor::Group
            include Thor::Actions

            def self.source_root
              File.dirname(__FILE__) + '/templates/'
            end

            def create_sql_database_folder
              directory('sql_database', './adapters/sql_database')
            end

            def bundle
              run 'bundle'
            end

            private

            def class_name
              @class_name
            end

            def domain_module_name
              DOMAIN.name.camelize
            end
          end
        end
      end
    end
  end
end

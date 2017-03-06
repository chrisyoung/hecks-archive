module Hecks
  module DomainAdapters
    module ResourceServer
      module CLI
        class GenerateResourceServer < Thor::Group
          include Thor::Actions

          def self.source_root
            File.dirname(__FILE__) + '/templates/'
          end

          def create_aggregate_folder
            directory('resource_server', '.')
          end

          def domain
            File.basename(Dir.getwd)
          end
        end
      end
    end
  end
end

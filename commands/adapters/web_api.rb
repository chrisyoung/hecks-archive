class Hecks < Thor
  module Adapters
    class WebAPI < Thor::Group
      include Thor::Actions

      def self.source_root
        File.dirname(__FILE__)
      end

      def create_web_api_folder
        directory('../templates/adapters/drivers/web_api', '.')
      end
    end
  end
end

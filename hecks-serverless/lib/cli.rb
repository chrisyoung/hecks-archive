module Hecks
  class Serverless
    class CLI < Thor
      include Thor::Actions
      package_name 'hecks_serverless'
      SELF_PATH        = File.dirname(__FILE__)
      DESCRIPTION      = "Generate config for running a function on lambda"
      COMMAND_NAME     = "generate"
      RESOURCES_FOLDER = "#{SELF_PATH}/../lib/resources"
      SERVERLESS_FILE  = "serverless.yml"
      CRUD_METHODS     = %w{create read update delete}
      HANDLER_TEMPLATE = 'handler.js'
      ENVIRONMENT_FILE = 'environment.js'

      desc COMMAND_NAME, DESCRIPTION
      def generate
        create_serverless_file
        create_domain_module_files
        insert_handlers_into_serverless_file
      end

      def self.source_root
        RESOURCES_FOLDER
      end

      private

      def insert_handlers_into_serverless_file
        insert_into_file SERVERLESS_FILE, handlers, :after => "functions:"
      end

      def create_serverless_file
        copy_file SERVERLESS_FILE
      end

      def create_domain_module_files
        domain_modules.each { |dmodule| create_handler_files(dmodule) }
      end

      def create_handler_files(dmodule)
        @domain_module = dmodule #make the module available to the template
        template HANDLER_TEMPLATE, "serverless/#{dmodule.name.downcase}.js"
        copy_file ENVIRONMENT_FILE, 'serverless/environment.js'
      end

      def handlers
        domain_modules.flat_map { |mod|
          @domain_module = mod
          crud
        }.join("\n")
      end

      def crud
        CRUD_METHODS.flat_map {|function| line(function)}
      end

      def domain_module
        @domain_module.name.downcase
      end

      def domain_modules
        DOMAIN.domain_modules.values
      end

      def line(function)
        <<~HEREDOC
          #{domain_module}_#{function}:
            handler: serverless/#{domain_module}.#{function}
        HEREDOC
      end
    end
  end
end

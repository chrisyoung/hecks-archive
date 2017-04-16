module Hecks
  class Serverless
    class CLI < Thor
      include Thor::Actions
      package_name 'hecks_serverless'
      SELF_PATH        = File.dirname(__FILE__)
      DESCRIPTION      = "Generate domain functions on lambda"
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

      attr_reader :locals

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
        self.locals = {domain_module: dmodule.name.downcase}
        template HANDLER_TEMPLATE, "serverless/#{dmodule.name.downcase}.js"
        copy_file ENVIRONMENT_FILE, 'serverless/environment.js'
        copy_file 'run_binary.js', 'serverless/run_binary.js'
        copy_file 'command_name.js', 'serverless/command_name.js'
      end

      def locals=(value)
        @locals ||= {}
        @locals.merge!(value)
      end

      def handlers
        "\n" + domain_modules.flat_map { |mod| crud(mod) }.join("\n")
      end

      def crud(domain_module)
        self.locals = {domain_module: domain_module.name.downcase}
        CRUD_METHODS.flat_map {|function| line(function, domain_module)}
      end

      def domain_modules
        DOMAIN.domain_modules.values
      end

      def line(function, domain_module)
        <<-HEREDOC
  #{domain_module.name.downcase}_#{function}:
    handler: serverless/#{domain_module.name.downcase}.#{function}
        HEREDOC
      end
    end
  end
end

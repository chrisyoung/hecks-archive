require 'active_support/inflector'
require 'pry'
require_relative 'hexagon/builder'

class Domain
  class Hexagon < Thor::Group
    include Thor::Actions

    class_option :schema, aliases: "-s", desc: "load schema from file"
    class_option :dry_run, aliases: "-d", desc: "Use when specifying a schema file to output the commands, without running them"

    argument :name, optional: true

    def self.source_root
      File.dirname(__FILE__)
    end

    def load_from_file
      return unless options[:schema]
      schema = JSON.parse(File.read(options[:schema]), symbolize_names: true)

      Hecks::Builder.new(schema, dry_run: !options[:dry_run].nil?).call
    end

    def create_hexagon_folder
      return if options[:schema]
      directory('templates/hexagon', "#{name}")
    end

    def copy_hidden_files
      return if options[:schema]
      copy_file('templates/hidden_files/gitignore', "#{name}/.gitignore")
      copy_file('templates/hidden_files/rspec', "#{name}/.rspec")
    end

    private

    def name
      @name + '_hexagon'
    end

    def domain_name
      @name + '_domain'
    end

    def module_name
      name.camelize
    end

    def domain_module_name
      domain_name.camelize
    end

    def condensed_module_name
      name.gsub('_', '')
    end
  end
end

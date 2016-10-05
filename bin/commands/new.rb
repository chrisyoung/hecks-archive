# frozen_string_literal: true
require 'active_support/inflector'
require 'pry'
require_relative '../generators/builder'

module Hecks
  class Commands
    class New < Thor::Group
      namespace :hecks
      include Thor::Actions

      class_option :schema, aliases: '-s', desc: 'load schema from file'
      class_option :name, aliases: '-n', desc: 'name of hexagon'
      class_option :dry_run, aliases: '-d', desc: 'Use when specifying a schema file to output the commands, without running them'

      def self.source_root
        File.dirname(__FILE__)
      end

      def load_from_file
        return unless options[:schema]
        schema = JSON.parse(File.read(options[:schema]), symbolize_names: true)
        Hecks::Builder.new(schema, name: options[:name], dry_run: !options[:dry_run].nil?).call
      end

      def create_hexagon_folder
        return if options[:schema]
        directory('../generators/templates/new', name.to_s)
      end

      private

      def name
        options[:name]
      end

      def module_name
        name.camelize
      end

      def domain_module_name
        domain_name.camelize
      end

      def condensed_module_name
        name.delete('_')
      end
    end
  end
end

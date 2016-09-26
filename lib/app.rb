require "thor"
require_relative "../lib/commands/generate"
require_relative "../lib/commands/new"

class App < Thor
  package_name "hecks"

  desc "generate:domain_object", "generate domain objects"
  method_option :type,
                aliases:  '-t',
                required: true,
                desc:     "The type of the domain object you want to generate",
                banner:   "[OBJECT_TYPE]",
                enum:     ['entity', 'value_object', 'aggregate']
  register GenerateDomainObject, "generate:domain_object", "generate:domain_object", "Generate adapters"
end

class App < Thor
  desc "generate:adapter", "generate adapters"
  method_option :type,
                aliases:  '-t',
                required: true,
                desc:     "The type of adapter you want to generate",
                banner:   "[ADAPTER_NAME]",
                enum:     ['resource_server', 'crud_commands', 'sql_database']

  method_option :module_name,
                aliases: '-m',
                desc:     "if applicable, the name of the adapter's domain module"
  register GenerateAdapter, "generate:adapter", "generate:adapter", "Generate adapters"
end

class App < Thor
  desc "new", "Generate a new hexagon"
  long_desc     "This will generate a new hexagon library"
  method_option :name,
                aliases:  '-n',
                required: true,
                desc:     "The name of the hexagon (required)",
                banner:   "[HEXAGON_NAME]"
  method_option :schema,
                aliases:  '-s',
                banner:   "FILE_NAME",
                desc:     "Load from a schema file"
  method_option :dryrun,
                aliases:  '-d',
                type:     :boolean,
                desc:     "Output commands without running"
  register Commands::New, "new", "new", "Create a new Hexagon"
end


App.start(ARGV)

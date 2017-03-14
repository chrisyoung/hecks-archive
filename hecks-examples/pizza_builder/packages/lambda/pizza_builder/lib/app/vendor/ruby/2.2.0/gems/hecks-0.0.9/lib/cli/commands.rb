require_relative 'commands/test' if File.file?('hecks.gemspec')
require_relative 'commands/generate'
require_relative 'commands/build' if File.file?('hecks.gemspec')
require_relative 'commands/console' if File.file?('HECKS')
require_relative 'commands/package'
require_relative 'commands/test' if File.file?('hecks.gemspec')

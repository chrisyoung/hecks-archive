require_relative 'commands/test' if Pathname.new("hecks.gemspec").exist?
require_relative 'commands/generate'
require_relative 'commands/build' if Pathname.new("hecks.gemspec").exist?
require_relative 'commands/console' if Pathname.new("HECKS").exist?
require_relative 'commands/package'

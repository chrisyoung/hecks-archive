module Hecks
  # Run a console with easy access to your domain
  class CLI < Thor
    desc 'console','REPL with domain helpers'
    def console
      exec "#{ENV['HECKS_PATH']}/bin/hecks_console" if ENV['HECKS_PATH']
      exec 'hecks_console'
    end
  end
end

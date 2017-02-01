module Hecks
  class Executable < Thor
    desc 'console','REPL with domain helpers'

    def console
      exec 'hecks_console'
    end
  end
end

module Hecks
  class CLI < Thor
    desc 'package','Package as a aws lamda function'

    def package
      exec 'hecks_package'
    end
  end
end

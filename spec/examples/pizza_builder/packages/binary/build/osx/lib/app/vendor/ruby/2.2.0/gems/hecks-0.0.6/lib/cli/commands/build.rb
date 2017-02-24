module Hecks
  class CLI < Thor
    desc 'build','build and install the hecks gem'

    def build
      exec(['gem build hecks',
      'gem install hecks'].join("&&"))
    end
  end
end

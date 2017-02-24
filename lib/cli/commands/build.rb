module Hecks
  class CLI < Thor
    include Thor::Actions

    desc 'build','build and install the hecks gem'

    def build
      run('gem build hecks')
      run('gem install hecks')
    end
  end
end

module HecksConsole
  # mixin methods to the console
  module Commands
    def app
      @app ||= HecksApplication.new(domain: HecksConsole.domain)
    end
  end
end

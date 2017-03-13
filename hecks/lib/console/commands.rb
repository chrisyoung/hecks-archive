module Hecks
  module Console
    module Commands
      def app
        @app ||= Hecks::Application.new(domain: Hecks::Console.domain)
      end
    end
  end
end

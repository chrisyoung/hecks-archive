Dir[File.dirname(__FILE__) + "/extensions/*.rb"].each {|file|require file}

module SoccerSeason
  module Domain
    module Fixtures
      class Result
        prepend ResultRankingsExtension
      end

      class Fixture
      end

      class Goal
      end
    end
  end
end

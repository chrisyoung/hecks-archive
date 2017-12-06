module SoccerSeason
  module Domain
    module Fixtures
      class Result
        prepend ResultRankingsExtension
      end

      class Fixture
        prepend FixtureExtension
      end

      class Goal
      end
    end
  end
end

module SoccerSeason
  module Domain
    module Fixtures
      module FixtureExtension
        def result=(value)
          @result = Result.factory(value)
        end
      end

      class Fixture
        prepend FixtureExtension
      end
    end
  end
end

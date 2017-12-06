module SoccerSeason
  module Domain
    module Fixtures
      module FixtureExtension
        def result=(value)
          @result = Result.factory(value)
        end
      end
    end
  end
end

module SoccerSeason
  module Domain
    module Fixtures
      class Fixture
        attr_accessor :date, :time, :teams, :pitch, :result, :id
        def initialize(date:, time:, teams:, pitch:, result: nil, id:)
          @date = date
          @time = time
          @teams = TeamReference.factory(teams)
          @pitch = PitchReference.factory(pitch)
          @result = Result.factory(result)
          @id = id
        end

        def to_json
          JSON.generate(date: date, time: time, teams: teams, pitch: pitch, result: result, id: id)
        end
      end
    end
  end
end

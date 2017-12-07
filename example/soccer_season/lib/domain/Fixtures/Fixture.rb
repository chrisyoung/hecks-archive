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

        def date=(date)
          @date = date
        end

        def time=(time)
          @time = time
        end

        def teams=(teams)
          @teams = TeamReference.factory(teams)
        end

        def pitch=(pitch)
          @pitch = PitchReference.factory(pitch)
        end

        def result=(result)
          @result = Result.factory(result)
        end

        def to_json
          JSON.generate(date: date, time: time, teams: teams, pitch: pitch, result: result, id: id)
        end
      end
    end
  end
end

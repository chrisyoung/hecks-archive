module SoccerSeason
  module Domain
    module Matches
      class Match
        attr_accessor :teams, :pitch, :goals, :id
        def initialize(teams:, pitch:, goals:, id:)
        @teams = Team.factory(teams)
@pitch = Pitch.new(pitch)
@goals = Goal.factory(goals)
@id = id
        end

        def to_json
          JSON.generate(teams: teams, pitch: pitch, goals: goals, id: id)
        end
      end
    end
  end
end

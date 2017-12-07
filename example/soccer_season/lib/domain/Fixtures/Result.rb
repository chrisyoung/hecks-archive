module SoccerSeason
  module Domain
    module Fixtures
      class Result
        attr_accessor :goals, :winner, :loser

        def self.factory(group_attributes)
          return if group_attributes.nil?
          return Result.new(group_attributes) unless group_attributes.is_a?(Array)
          group_attributes.map do |attributes|
            Result.new(attributes)
          end
        end

        def initialize(goals:, winner: nil, loser: nil)
          @goals = Goal.factory(goals)
          @winner = TeamReference.factory(winner)
          @loser = TeamReference.factory(loser)
        end

        def goals=(goals)
          @goals = Goal.factory(goals)
        end

        def winner=(winner)
          @winner = TeamReference.factory(winner)
        end

        def loser=(loser)
          @loser = TeamReference.factory(loser)
        end

        def to_json(config)
          JSON.generate(goals: goals, winner: winner, loser: loser)
        end
      end
    end
  end
end

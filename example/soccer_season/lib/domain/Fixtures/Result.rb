module SoccerSeason
  module Domain
    module Fixtures
      class Result
        attr_accessor :goals, :winner, :loser

        def self.factory(group_attributes)
          return if group_attributes.nil?
          unless group_attributes.is_a?(Array)
            return Result.new(group_attributes)
          end
          group_attributes.map do |attributes|
            Result.new(attributes)
          end
        end

        def initialize(goals:)
          @goals = Goal.factory(goals)
          # @winner = TeamReference.factory(winner)
          # @loser = TeamReference.factory(loser)
        end

        def goals=(goals)
          @goals = Goal.factory(goals)
        end

        def to_json(config)
          JSON.generate(goals: goals, winner: winner, loser: loser)
        end
      end
    end
  end
end

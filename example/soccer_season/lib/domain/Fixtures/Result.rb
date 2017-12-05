module SoccerSeason
  module Domain
    module Fixtures
      class Result
        attr_accessor :winner, :loser, :goals

        def self.factory(group_attributes)
          return if group_attributes.nil?
          return Result.new(group_attributes) unless group_attributes.is_a?(Array)
          group_attributes.map do |attributes|
            Result.new(attributes)
          end
        end

        def initialize(winner:, loser:, goals:)
          @winner = TeamReference.factory(winner)
@loser = TeamReference.factory(loser)
@goals = Goal.factory(goals)
        end

        def to_json(config)
          JSON.generate(winner: winner, loser: loser, goals: goals)
        end
      end
    end
  end
end

module SoccerSeason
  module Domain
    module Fixtures
      class Result
        attr_accessor :goals
        attr_reader :winner, :loser

        def self.factory(group_attributes)
          return if group_attributes.nil?
          return Result.new(group_attributes) unless group_attributes.is_a?(Array)
          group_attributes.map do |attributes|
            Result.new(attributes)
          end
        end

        def initialize(goals:)
          @goals = Goal.factory(goals)
        end

        def to_json(config)
          JSON.generate(goals: goals)
        end
      end
    end
  end
end

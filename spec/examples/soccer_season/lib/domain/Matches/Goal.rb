module SoccerSeason
  module Domain
    module Matches
      class Goal
        attr_accessor :time, :player

        def self.factory(goal_group_attributes)
          goal_group_attributes.map do |attributes|
            Goal.new(attributes)
          end
        end

        def initialize(time:, player:)
          @time = time
@player = PlayerReference.new(player)
        end

        def to_json(config)
          JSON.generate(time: time, player: player)
        end
      end
    end
  end
end

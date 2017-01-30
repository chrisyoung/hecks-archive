module SoccerSeason
  module Domain
    module Matches
      class Goal
        attr_accessor :player

        def self.factory(goal_group_attributes)
          goal_group_attributes.map do |attributes|
            Goal.new(attributes)
          end
        end

        def initialize(player:)
          @player = Player.new(player)
        end

        def to_json(config)
          JSON.generate(player: player)
        end
      end
    end
  end
end

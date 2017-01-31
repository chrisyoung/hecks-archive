module SoccerSeason
  module Domain
    module Matches
      class Goal
        attr_accessor :time, :player

        def self.factory(group_attributes)
          return Goal.new(group_attributes) unless group_attributes.is_a?(Array)
          group_attributes.map do |attributes|
            Goal.new(attributes)
          end
        end

        def initialize(time:, player:)
          @time = time
@player = PlayerReference.factory(player)
        end

        def to_json(config)
          JSON.generate(time: time, player: player)
        end
      end
    end
  end
end

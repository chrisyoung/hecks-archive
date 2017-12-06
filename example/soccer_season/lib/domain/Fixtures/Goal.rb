module SoccerSeason
  module Domain
    module Fixtures
      class Goal
        attr_accessor :player

        def self.factory(group_attributes)
          return if group_attributes.nil?
          return Goal.new(group_attributes) unless group_attributes.is_a?(Array)
          group_attributes.map do |attributes|
            Goal.new(attributes)
          end
        end

        def initialize(player:)
          @player = PlayerReference.factory(player)
        end

        def to_json(config)
          JSON.generate(player: player)
        end
      end
    end
  end
end

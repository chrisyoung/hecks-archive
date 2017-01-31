module SoccerSeason
  module Domain
    module Matches
      class Result
        attr_accessor :winner, :type

        def self.factory(group_attributes)
          return Result.new(group_attributes) unless group_attributes.is_a?(Array)
          group_attributes.map do |attributes|
            Result.new(attributes)
          end
        end

        def initialize(winner:, type:)
          @winner = TeamReference.factory(winner)
@type = type
        end

        def to_json(config)
          JSON.generate(winner: winner, type: type)
        end
      end
    end
  end
end

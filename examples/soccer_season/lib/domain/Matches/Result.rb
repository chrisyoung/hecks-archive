module SoccerSeason
  module Domain
    module Matches
      class Result
        attr_accessor :winner, :type

        def self.factory(result_group_attributes)
          result_group_attributes.map do |attributes|
            Result.new(attributes)
          end
        end

        def initialize(winner:, type:)
          @winner = TeamReference.new(winner)
@type = type
        end

        def to_json(config)
          JSON.generate(winner: winner, type: type)
        end
      end
    end
  end
end

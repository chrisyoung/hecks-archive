module SoccerSeason
  module Domain
    module Matches
      class Result
        attr_accessor :winner

        def self.factory(result_group_attributes)
          result_group_attributes.map do |attributes|
            Result.new(attributes)
          end
        end

        def initialize(winner:)
          @winner = Team.new(winner)
        end

        def to_json(config)
          JSON.generate(winner: winner)
        end
      end
    end
  end
end

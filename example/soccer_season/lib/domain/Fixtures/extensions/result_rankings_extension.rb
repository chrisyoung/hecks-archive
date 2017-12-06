module SoccerSeason
  module Domain
    module Fixtures
      module ResultRankingsExtension
        attr_reader :winner, :loser

        def initialize(group_attributes)
          super
          lookup_teams
          calculate_rankings
          set_winner_and_looser
        end

        private

        attr_reader :rankings, :teams

        def set_winner_and_looser
          return if rankings[0] == rankings[1] # A TIE!
          @winner = teams.find {|team| team.name == rankings[0][1]}
          @loser = teams.find {|team| team.name == rankings[1][1]}
        end

        def lookup_teams
          @teams = goals.map do |goal|
            Teams::Repository.read(
              Players::Repository.read(goal.player.id).team.id
            )
          end
        end

        # Count the number of goals and sort
        # [[3, "TeamA"], [1, "TeamB"]]
        def calculate_rankings
          @rankings = teams
            .group_by {|a| a.name}
            .inject(Hash.new(0)) do |h,v|
              h[v[1].count] = v[0];h
            end.sort.reverse
        end
      end
    end
  end
end

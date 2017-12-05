class HecksApplication
  describe 'Soccer Season' do
    it 'A playground for soccer season' do
      app = HecksApplication.new(domain: SoccerSeason)

      create_team_a = app[:teams].create(name: "Team Alpha")
      create_team_b = app[:teams].create(name: "Team Beta")

      create_chris = app[:players].create(
        name: "Chris Young",
        team: { id: create_team_a.result[:id] })
      create_tanya = app[:players].create(
        name: "Taynay Young",
        team: { id: create_team_b.result[:id] })

      create_pitch = app[:pitches].create(name: "My Backyard")

      fixture = app[:fixtures].create(
        date: Date.today,
        time: Time.now,
        # result: {
        #   winner: {id: create_team_b.result[:id]},
        #   loser: {id: create_team_a.result[:id]},
        #   goals: []
        # },
        teams: [
          { id: create_chris.result[:id] },
          { id: create_tanya.result[:id] },
        ],
        pitch: { id: create_pitch.result[:id] }
      )
      expect(fixture.result[:success]).to be true
      expect(fixture.result[:errors]).to eq({})
    end
  end
end

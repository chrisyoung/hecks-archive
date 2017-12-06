class HecksApplication
  describe 'Soccer Season' do
    it 'A playground for soccer season' do
      # The SoccerSeason Domain App
      app = HecksApplication.new(domain: SoccerSeason)

      # Two Teams
      create_team_a = app[:teams].create(name: "Team Alpha")
      create_team_b = app[:teams].create(name: "Team Beta")

      # Two Players
      create_chris = app[:players].create(
        name: "Chris Young",
        team: { id: create_team_a.result[:id] })
      create_tanya = app[:players].create(
        name: "Taynay Young",
        team: { id: create_team_b.result[:id] })

      chris_id = create_chris.result[:id]
      tanya_id = create_tanya.result[:id]

      # A Pitch to play on
      create_pitch = app[:pitches].create(name: "My Backyard")

      # A few goals, team a scored more
      goals = [
        { player: { id: chris_id } },
        { player: { id: chris_id } },
        { player: { id: tanya_id } }
      ]

      # A fixture with no result
      create_fixture = app[:fixtures].create(
        date: Date.today,
        time: Time.now,
        teams: [
          { id: create_chris.result[:id] },
          { id: create_tanya.result[:id] },
        ],
        pitch: { id: create_pitch.result[:id] }
      )
      fixture_id = create_fixture.result[:id]

      # It works, right?
      expect(create_fixture.result[:success]).to be true
      expect(create_fixture.result[:errors]).to eq({})

      # Lets add a result
      update_fixture = app[:fixtures].update id: fixture_id, result: { goals: goals }

      # Finally, lets read the fixture
      fixture = app[:fixtures].read fixture_id

      # TeamA Wins, TeamB loses
      expect(fixture.result.winner.id).to eq create_team_a.result[:id]
      expect(fixture.result.loser.id).to eq create_team_b.result[:id]
    end
  end
end

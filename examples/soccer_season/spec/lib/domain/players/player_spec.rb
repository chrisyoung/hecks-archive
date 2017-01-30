describe SoccerSeason::Domain::Players::Player do
  subject {
    described_class.new(name: "Chris Young", team: {id: 1}, id: 1)
  }

  it do
    expect(subject.team.id).to eq 1
  end
end

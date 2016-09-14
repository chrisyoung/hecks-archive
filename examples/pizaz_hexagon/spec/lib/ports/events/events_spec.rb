class TestListener
  def self.testmodule_testcommand(command)
  end
end

module TestModule
  class TestCommand
  end
end

describe PizazHexagon::Ports::Events do
  let(:listener) { TestListener }
  let(:command)  { TestModule::TestCommand.new }
  subject { described_class.new(listeners: [listener])}

  describe '#send' do
    it 'calls the event as a method on listeners' do
      expect(listener).to receive(:testmodule_testcommand).with(command)
      subject.send(command)
    end
  end
end

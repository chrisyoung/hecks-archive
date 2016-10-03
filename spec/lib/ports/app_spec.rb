class FakeRepository
  def self.create(args)
  end
end

class FakeDatabase
  def [](value)
    FakeRepository
  end
end

class FakeListener
  def self.pizzas_create(command)
  end
end

class FakeDomainModule
  def schemas(name: )
    {
      type:       "object",
      title:      "pizza",
      required:   [:name],
      properties: { name: { type: "string" } }
    }
  end
end

class FakeDomain
  def modules(name)
    FakeDomainModule.new
  end

  def new
  end
end

describe Hecks::Ports::Left::App do
  let(:fake_database) { FakeDatabase.new }
  let(:fake_domain)   { FakeDomain.new }
  let(:fake_listener) { FakeListener }

  subject { described_class.new(database: fake_database, listeners: [fake_listener], domain: fake_domain) }

  describe '#call' do
    it 'calls the method on the repository' do
      expect(FakeRepository).to receive(:create).with({ name: "White Pizza" })
      subject.call(command_name: :create, module_name: :pizzas, args: { name: "White Pizza" })
    end

    it 'broadcasts the command over the events port' do
      expect(FakeListener).to receive(:pizzas_create)
      subject.call(command_name: :create, module_name: :pizzas, args: { name: "White Pizza" })
    end

    it 'runs validations' do
      result = subject.call(command_name: :create, module_name: :pizzas, args: { name: 1 } )
      expect(result.errors.first).to include("Fixnum did not match the following type")
    end
  end
end

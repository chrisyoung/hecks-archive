class AppRunner
  def initialize(args:, application:)
    @args = Args.new(args)
    @application = application
  end

  def call
    case args.method
    when 'create', 'read', 'delete'
      domain_module.send(args.method, args.data).call
    when 'update'
      id = args.data.delete(:id)
      domain_module.send(args.method, id, args.data).call
    end
  end

  private

  attr_reader :args, :application

  def domain_module
    application[args.domain_module]
  end
end

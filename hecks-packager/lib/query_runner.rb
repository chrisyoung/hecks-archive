module HecksPackager
  class QueryRunner
    def initialize(args:, application:)
      @args = Args.new(args)
      @application = application
    end

    def call
      domain_module.send(args.method, args.data)
    end

    private

    attr_reader :args, :application

    def domain_module
      application[args.domain_module]
    end
  end
end

class NextDomain
  class Activator
    include Singleton

    def self.call(domain)
      instance.activate(domain)
    end

    def initialize
      @files = []
    end

    def activate(domain)
      domain.ruby_file = build_file('domain', domain.get_binding)
      domain.aggregates.each do |aggregate|
        aggregate.ruby_file = build_file('aggregate', aggregate.get_binding)
        aggregate.domain_objects.each do |domain_object|
          domain_object.ruby_file = build_file('domain_object', domain_object.get_binding)
          build_file('domain_object', domain_object.get_binding)
        end
      end

      @files.each { |file| TOPLEVEL_BINDING.eval(file) }
      self
    end

    def build_file(name, context)
      Erubis::Eruby.new(read_template(name)).result(context).tap do |file|
        @files << file
      end
    end

    def read_template(name)
      File.open(File.dirname(__FILE__) + "/../next_domain/templates/#{name}.erb").read
    end
  end
end
class NextDomain
  class Activator
    include Singleton

    def self.call(domain)
      instance.activate(domain)
    end

    def self.print
      instance.print
    end

    def initialize
      @files = []
    end

    def print
      @files.each do |file|
        puts file
      end
    end

    def activate(domain)
      build_file('domain', domain.get_binding)
      domain.aggregates.each do |aggregate|
        build_file('aggregate', aggregate.get_binding)
        aggregate.domain_objects.each do |domain_object|
          build_file('domain_object', domain_object.get_binding)
        end
      end

      @files.each { |file| TOPLEVEL_BINDING.eval file }
      self
    end

    def build_file(name, context)
      @files << ERB.new(read_template(name), nil, '-').result(context)
    end

    def read_template(name)
      File.open(File.dirname(__FILE__) + "/../next_domain/templates/#{name}.erb").read
    end
  end
end
class GenerateResourceServer < Thor::Group; end

class GeneratePackage
  include Thor::Actions

  def self.source_root
    File.dirname(__FILE__) + '/templates/'
  end

  def create_package
    directory('package', './packages/lambda')
  end

  def domain
    File.basename(Dir.getwd)
  end
end

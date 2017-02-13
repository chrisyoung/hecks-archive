class GenerateResourceServer < Thor::Group; end

class GenerateResourceServer
  include Thor::Actions

  def self.source_root
    File.dirname(__FILE__) + '/templates/'
  end

  def create_aggregate_folder
    directory('resource_server', '.')
  end

  def domain
    File.basename(Dir.getwd)
  end

  private
end

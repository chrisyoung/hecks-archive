class GenerateResourceServer < Thor::Group; end

class GenerateResourceServer
  include Thor::Actions

  # class_option :referenced_entity, aliases: '-r', desc: 'Referenced Entity'

  def self.source_root
    File.dirname(__FILE__) + '/../../../generators/templates/generate/'
  end

  def create_aggregate_folder
    directory('resource_server', '.')
  end

  def domain
    File.basename(Dir.getwd)
  end

  private
end

class HecksAggregate < Thor::Group
  include Thor::Actions

  argument :name
  argument :head_name
  argument :attributes, type: :hash

  def self.source_root
    File.dirname(__FILE__)
  end

  def create_aggregate_folder
    directory('templates/aggregate', '.')
  end
end

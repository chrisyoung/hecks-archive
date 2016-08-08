class HecksAggregate < Thor::Group
  include Thor::Actions

  argument :name

  class_option :head_name, :aliases => "-h", :desc => "the name of the aggregate head"
  class_option :attributes, :aliases => "-a", type: :hash, :desc => "attributes for the aggregate head"
  def self.source_root
    File.dirname(__FILE__)
  end

  def head_name
    options[:head_name]
  end

  def attributes
    options[:attributes]
  end

  def create_aggregate_folder
    directory('../templates/aggregate', '.')
  end
end

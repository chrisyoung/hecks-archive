class GenerateReadme < Thor::Group
  include Thor::Actions

  def self.source_root
    File.dirname(__FILE__) + '/templates'
  end

  def create_readme
    template('Readme.md', './Readme.md')
  end
end

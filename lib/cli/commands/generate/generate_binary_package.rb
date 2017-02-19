class GenerateBinaryPackage < Thor::Group
  include Thor::Actions

  HOST          = "http://d6r77u77i8pq3.cloudfront.net/releases"
  OSX_BINARY    = "traveling-ruby-20150715-2.2.2-osx.tar.gz"
  LINUX_BINARY  = 'traveling-ruby-20150715-2.2.2-linux-x86_64.tar.gz'
  RESOURCES_DIR = 'packages/binary/build/resources'
  APP_DIR       = 'packages/binary/build/osx/lib/app'

  def self.source_root
    File.dirname(__FILE__) + '/templates'
  end

  def create_package_folder
    directory('binary_package', './packages/binary')
  end

  def domain_name
    Dir.pwd.split('/').last
  end

  def package
    run("cd #{RESOURCES_DIR} && curl -O #{HOST}/#{OSX_BINARY}")
    run("cd #{RESOURCES_DIR} && curl -O #{HOST}/#{LINUX_BINARY}")
    run("tar -xzf #{RESOURCES_DIR}/#{OSX_BINARY} -C osx/lib/ruby")
    run("cd #{APP_DIR} && bundle install")
  end
end

class GenerateBinaryPackage < Thor::Group
  include Thor::Actions

  HOST          = "http://d6r77u77i8pq3.cloudfront.net/releases"
  OSX_BINARY    = "traveling-ruby-20150715-2.2.2-osx.tar.gz"
  LINUX_BINARY  = 'traveling-ruby-20150715-2.2.2-linux-x86_64.tar.gz'
  RESOURCES_DIR = 'packages/binary/build/resources'
  OSX_DIR       = 'packages/binary/build/osx'
  APP_DIR       = 'packages/binary/build/osx/lib/app'
  LIB_DIR       = 'packages/binary/build/osx/lib'


  def self.source_root
    File.dirname(__FILE__) + '/templates'
  end

  def create_package_folder
    run("rm -rf packages")
    directory('binary_package', './packages/binary')
  end

  def domain_name
    Dir.pwd.split('/').last
  end

  def package
    empty_directory(APP_DIR)
    empty_directory(LIB_DIR + '/ruby')
    run("cd #{RESOURCES_DIR} && curl -O #{HOST}/#{OSX_BINARY}")
    run("tar -xzf #{RESOURCES_DIR}/#{OSX_BINARY} -C #{LIB_DIR}/ruby")
    run("cp #{RESOURCES_DIR}/Gemfile #{APP_DIR}")
    run("cp -rf #{RESOURCES_DIR}/bundle #{APP_DIR}/.bundle")
    run("cp -rf #{RESOURCES_DIR}/hello.rb #{APP_DIR}/hello.rb")
    run("cp -rf #{RESOURCES_DIR}/wrapper #{OSX_DIR}/hello")

    say "ATTENTION!"
    say "One More thing: Run bundle in the app dir before deploying."
  end
end

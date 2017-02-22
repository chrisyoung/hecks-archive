require 'bundler/setup'
class GenerateBinaryPackage < Thor::Group
  include Thor::Actions

  HOST          = "http://d6r77u77i8pq3.cloudfront.net/releases"
  RESOURCES_DIR = 'packages/binary/build/resources'

  OSX_BINARY    = "traveling-ruby-20150715-2.2.2-osx.tar.gz"
  LINUX_BINARY  = 'traveling-ruby-20150715-2.2.2-linux-x86_64.tar.gz'
  OSX_DIR       = 'packages/binary/build/osx'
  LINUX_DIR     = 'packages/binary/build/linux-x86_64'
  OSX_APP_DIR   = 'packages/binary/build/osx/lib/app'
  LINUX_APP_DIR = 'packages/binary/build/osx/linux-x86_64/app'
  OSX_LIB_DIR   = 'packages/binary/build/osx/lib'
  LINUX_LIB_DIR = 'packages/binary/build/linux-x86_64/lib'

  def self.source_root
    File.dirname(__FILE__) + '/templates'
  end

  def create_package_folder
    run("rm -rf packages/binary")
    directory('binary_package', './packages/binary')
  end

  def domain_name
    Dir.pwd.split('/').last
  end

  def package_osx
    package(OSX_APP_DIR, OSX_LIB_DIR, OSX_BINARY, OSX_DIR)
  end

  def package_linux
    # package(LINUX_APP_DIR, LINUX_LIB_DIR, LINUX_BINARY, LINUX_DIR)
  end

  def warn
    say "\nATTENTION!"
    say "One More thing: Run bundle in the app dir before deploying.\n"
  end

  private

  def package(app_dir, lib_dir, binary, package_dir)
    empty_directory(app_dir)
    empty_directory(lib_dir + '/ruby')
    run("cd #{RESOURCES_DIR} && curl -O #{HOST}/#{binary}")
    run("tar -xzf #{RESOURCES_DIR}/#{binary} -C #{lib_dir}/ruby")
    run("cp #{RESOURCES_DIR}/Gemfile #{app_dir}")
    run("cp #{RESOURCES_DIR}/Gemfile /tmp")
    run("cp -rf #{RESOURCES_DIR}/bundle #{app_dir}/.bundle")
    run("cp -rf #{RESOURCES_DIR}/bundle /tmp")
    run("cp -rf #{RESOURCES_DIR}/#{domain_name}.rb #{app_dir}/#{domain_name}.rb")
    run("cp -rf #{RESOURCES_DIR}/wrapper #{package_dir}/#{domain_name}")
    Bundler.with_clean_env do
      run("cd #{app_dir} && BUNDLE_IGNORE_CONFIG=1 bundle install --path . --without development")
    end
  end
end

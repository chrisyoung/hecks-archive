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
    remove_tests(OSX_APP_DIR)
  end

  def package_linux
    # package(LINUX_APP_DIR, LINUX_LIB_DIR, LINUX_BINARY, LINUX_DIR)
  end

  private

  def package(app_dir, lib_dir, binary, package_dir)
    empty_directory(app_dir)
    empty_directory(lib_dir + '/ruby')
    download(binary, lib_dir)
    copy_resources(app_dir, package_dir)
    bundle_with_ruby_2_2_2(app_dir)
  end

  def copy_resources(app_dir, package_dir)
    run("cp #{RESOURCES_DIR}/Gemfile #{app_dir}")
    run("cp -rf #{RESOURCES_DIR}/bundle #{app_dir}/.bundle")
    run("cp -rf #{RESOURCES_DIR}/#{domain_name}.rb #{app_dir}/#{domain_name}.rb")
    run("cp -rf #{RESOURCES_DIR}/wrapper #{package_dir}/#{domain_name}")
    run("cd #{package_dir} && chmod 744 #{domain_name}")
  end

  def download(binary, lib_dir)
    run("cd #{RESOURCES_DIR} && curl -O #{HOST}/#{binary}")
    run("tar -xzf #{RESOURCES_DIR}/#{binary} -C #{lib_dir}/ruby")
  end

  def bundle_with_ruby_2_2_2(app_dir)
    run("cp -rf #{RESOURCES_DIR}/Dockerfile #{app_dir}")
    run("cp #{domain_name}-0.0.0.gem #{app_dir}" )
    run("cd #{app_dir} && docker build -t #{domain_name} --no-cache .")
    container = `docker create pizza_builder:latest`.gsub("\n", '')
    run("docker cp #{container}:/usr/src/app/vendor #{app_dir}")
  end

  def remove_tests(app_dir)
    run("rm -rf #{app_dir}/vendor/ruby/*/gems/*/test")
    run("rm -rf #{app_dir}/vendor/ruby/*/gems/*/tests")
    run("rm -rf #{app_dir}/vendor/ruby/*/gems/*/spec")
    run("rm -rf #{app_dir}/vendor/ruby/*/gems/*/features")
    run("rm -rf #{app_dir}/vendor/ruby/*/gems/*/benchmark")
  end
end

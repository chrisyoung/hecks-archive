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
    run("cd #{APP_DIR} && bundle install")
  end

  # def remove_tests
  #   run("rm -rf #{APP_DIR}/vendor/ruby/*/gems/*/test")
  #   run("rm -rf #{APP_DIR}/vendor/ruby/*/gems/*/tests")
  #   run("rm -rf #{APP_DIR}/vendor/ruby/*/gems/*/spec")
  #   run("rm -rf #{APP_DIR}/vendor/ruby/*/gems/*/features")
  #   run("rm -rf #{APP_DIR}/vendor/ruby/*/gems/*/benchmark")
  # end
  #
  # def remove_documentation
  #   run("rm -f #{APP_DIR}/vendor/ruby/*/gems/*/README*")
  #   run("rm -f #{APP_DIR}/vendor/ruby/*/gems/*/CHANGE*")
  #   run("rm -f #{APP_DIR}/vendor/ruby/*/gems/*/Change*")
  #   run("rm -f #{APP_DIR}/vendor/ruby/*/gems/*/COPYING*")
  #   run("rm -f #{APP_DIR}/vendor/ruby/*/gems/*/LICENSE*")
  #   run("rm -f #{APP_DIR}/vendor/ruby/*/gems/*/MIT-LICENSE*")
  #   run("rm -f #{APP_DIR}/vendor/ruby/*/gems/*/TODO")
  #   run("rm -f #{APP_DIR}/vendor/ruby/*/gems/*/*.txt")
  #   run("rm -f #{APP_DIR}/vendor/ruby/*/gems/*/*.md")
  #   run("rm -f #{APP_DIR}/vendor/ruby/*/gems/*/*.rdoc")
  #   run("rm -rf #{APP_DIR}/vendor/ruby/*/gems/*/doc")
  #   run("rm -rf #{APP_DIR}/vendor/ruby/*/gems/*/docs")
  #   run("rm -rf #{APP_DIR}/vendor/ruby/*/gems/*/example")
  #   run("rm -rf #{APP_DIR}/vendor/ruby/*/gems/*/examples")
  #   run("rm -rf #{APP_DIR}/vendor/ruby/*/gems/*/sample")
  #   run("rm -rf #{APP_DIR}/vendor/ruby/*/gems/*/doc-api")
  # end
  #
  # def remove_misc_files
  #   run("rm -rf #{APP_DIR}/vendor/ruby/*/gems/*/.gitignore")
  #   run("rm -rf #{APP_DIR}/vendor/ruby/*/gems/*/.travis.yml")
  # end
  #
  # def remove_native_extension_cruft
  #   run("rm -f #{APP_DIR}/vendor/ruby/*/gems/*/ext/Makefile")
  #   run("rm -f #{APP_DIR}/vendor/ruby/*/gems/*/ext/*/Makefile")
  #   run("rm -f #{APP_DIR}/vendor/ruby/*/gems/*/ext/*/tmp")
  #   run("find #{APP_DIR}/vendor/ruby -name '*.c' | xargs rm -f")
  #   run("find #{APP_DIR}/vendor/ruby -name '*.cpp' | xargs rm -f")
  #   run("find #{APP_DIR}/vendor/ruby -name '*.h' | xargs rm -f")
  #   run("find #{APP_DIR}/vendor/ruby -name '*.rl' | xargs rm -f")
  #   run("find #{APP_DIR}/vendor/ruby -name 'extconf.rb' | xargs rm -f")
  #   run("find #{APP_DIR}/vendor/ruby/*/gems -name '*.o' | xargs rm -f")
  #   run("find #{APP_DIR}/vendor/ruby/*/gems -name '*.so' | xargs rm -f")
  #   run("find #{APP_DIR}/vendor/ruby/*/gems -name '*.bundle' | xargs rm -f")
  # end
  #
  # def remove_jruby
  #   run("find #{APP_DIR}/vendor/ruby -name '*.java' | xargs rm -f")
  #   run("find #{APP_DIR}/vendor/ruby -name '*.class' | xargs rm -f")
  # end
  #
  # def remove_encodings
  #   run("rm -f #{APP_DIR}/ruby/lib/ruby/*/*/enc/cp949*")
  #   run("rm -f #{APP_DIR}/ruby/lib/ruby/*/*/enc/euc_*")
  #   run("rm -f #{APP_DIR}/ruby/lib/ruby/*/*/enc/shift_jis*")
  #   run("rm -f #{APP_DIR}/ruby/lib/ruby/*/*/enc/koi8_*")
  #   run("rm -f #{APP_DIR}/ruby/lib/ruby/*/*/enc/emacs*")
  #   run("rm -f #{APP_DIR}/ruby/lib/ruby/*/*/enc/gb*")
  #   run("rm -f #{APP_DIR}/ruby/lib/ruby/*/*/enc/big5*")
  #   run("rm -f #{APP_DIR}/ruby/lib/ruby/*/*/enc/windows*")
  #   run("rm -f #{APP_DIR}/ruby/lib/ruby/*/*/enc/utf_16*")
  #   run("rm -f #{APP_DIR}/ruby/lib/ruby/*/*/enc/utf_32*")
  # end
end

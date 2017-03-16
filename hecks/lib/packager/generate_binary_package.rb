module Hecks
  module Packager
    module CLI
      class GenerateBinaryPackage < Thor::Group
        include Thor::Actions

        class_option :no_cache, aliases: '-n', desc: 'download resources', default: false, type: :boolean

        HOST          = "http://d6r77u77i8pq3.cloudfront.net/releases"
        OSX_BINARY    = "traveling-ruby-20150715-2.2.2-osx.tar.gz"
        LINUX_BINARY  = 'traveling-ruby-20150715-2.2.2-linux-x86_64.tar.gz'
        MYSQL_GEM     = 'traveling-ruby-gems-20150715-2.2.2-osx/mysql2-0.3.18.tar.gz'
        BUILD_DIR     = 'packages/binary/build'
        RESOURCES_DIR = BUILD_DIR     + '/resources'
        OSX_DIR       = BUILD_DIR     + '/osx'
        OSX_LIB_DIR   = OSX_DIR       + '/lib'
        OSX_APP_DIR   = OSX_LIB_DIR   + '/app'
        LINUX_DIR     = BUILD_DIR     + '/linux-x86_64'
        LINUX_LIB_DIR = LINUX_DIR     + 'lib'
        LINUX_APP_DIR = LINUX_LIB_DIR + '/app'

        def self.source_root
          File.dirname(__FILE__) + '/templates'
        end

        def create_package_folder
          directory('binary_package', './packages/binary')
        end

        def domain_name
          Dir.pwd.split('/').last
        end

        def build
          package(OSX_APP_DIR, OSX_LIB_DIR, OSX_BINARY, OSX_DIR)
          # package(LINUX_APP_DIR, LINUX_LIB_DIR, LINUX_BINARY, LINUX_DIR)
        end

        private

        def package(app_dir, lib_dir, binary, package_dir)
          empty_directory(app_dir)
          empty_directory(lib_dir + '/ruby')
          if refresh_cache?(app_dir)
            download_binary(binary, lib_dir)
            download_gem(MYSQL_GEM, RESOURCES_DIR)
            remove_native_extensions
            unpack_gem(MYSQL_GEM, OSX_LIB_DIR)
          end
          copy_resources(app_dir, package_dir)
          bundle_with_ruby_2_2_2(app_dir)
          reduce_package_size(app_dir)
        end

        def unpack_gem(ruby_gem, lib_dir)
          run("tar -xzf #{RESOURCES_DIR}/#{ruby_gem} -C #{lib_dir}/ruby")
        end

        def remove_native_extensions
          run("rm -rf #{OSX_APP_DIR}/vendor/ruby/*/extensions")
          run("find #{OSX_APP_DIR}/vendor/ruby/*/gems -name '*.so' | xargs rm -f")
          run("find #{OSX_APP_DIR}/vendor/ruby/*/gems -name '*.bundle' | xargs rm -f")
          run("find #{OSX_APP_DIR}/vendor/ruby/*/gems -name '*.o' | xargs rm -f")
        end

        def refresh_cache?(app_dir)
          return true if options[:no_cache]
          return Dir[app_dir + '/*'].empty?
        end

        def copy_resources(app_dir, package_dir)
          template "Gemfile", "#{RESOURCES_DIR}/Gemfile"
          run("cp -rf #{RESOURCES_DIR}/Gemfile #{app_dir}/Gemfile")
          run("cp -rf #{RESOURCES_DIR}/bundle #{app_dir}/.bundle")
          run("cp -rf #{RESOURCES_DIR}/#{domain_name}.rb #{app_dir}/#{domain_name}.rb")
          run("cp -rf #{RESOURCES_DIR}/wrapper #{package_dir}/#{domain_name}")
          run("cd #{package_dir} && chmod 744 #{domain_name}")
        end

        def download_binary(binary, lib_dir)
          run("cd #{RESOURCES_DIR} && curl -O #{HOST}/#{binary}")
          run("tar -xzf #{RESOURCES_DIR}/#{binary} -C #{lib_dir}/ruby")
        end

        def download_gem(ruby_gem, lib_dir)
          run("cd #{RESOURCES_DIR} && curl -O #{HOST}/#{ruby_gem}")
        end

        def bundle_with_ruby_2_2_2(app_dir)
          run("cp -rf #{RESOURCES_DIR}/Dockerfile #{app_dir}")
          run("cp #{domain_name}-0.0.0.gem #{app_dir}")
          run("cd #{app_dir} && docker build -t #{domain_name} --no-cache .")
          container = `docker create pizza_builder:latest`.gsub("\n", '')
          run("docker cp #{container}:/usr/src/app/vendor #{app_dir}")
        end

        def reduce_package_size(app_dir)
          files = %w(test tests spec features benchmark README* CHANGE* Change*
            COPYING* LICENSE* MIT-LICENSE* TODO *.txt *.md *.rdoc doc docs example
            examples sample doc-api)

          files.each do |file|
            run("rm -rf #{app_dir}/vendor/ruby/*/gems/*/#{file}")
          end

          run("rm -rf #{app_dir}/vendor/*/*/cache/*")

          %w(.gitignore .travis.yml).each do |file|
            run("rm -rf #{app_dir}/vendor/ruby/*/gems/*/#{file}")
          end

          %w(MAKEfile */Makefile */tmp).each do |file|
            run("rm -f #{app_dir}/vendor/ruby/*/gems/*/ext/#{file}")
          end
          %w(*.c *.cpp *.h *.rl *extconf.rb *.java *.class *.md).each do |file|
            run("find #{app_dir}/vendor/ruby -name '#{file}' | xargs rm -f")
          end
          %w(*.0 *.so *.bundle).each do |file|
            run("find #{app_dir}/vendor/ruby/*/gems -name '#{file}' | xargs rm -f")
          end
        end
      end
    end
  end
end

module Hecks
  module Packager
    module CLI
      class GenerateBinaryPackage < Thor::Group
        include Thor::Actions

        class_option :cache, aliases: '-c', desc: 'skip downloading resources', default: true, type: :boolean
        class_option :download, aliases: '-d', desc: 'download', default: true, type: :boolean
        class_option :reduce_package_size, aliases: '-r', desc: 'delete unneeded cruft in gems', default: true, type: :boolean
        class_option :latest, aliases: '-l', desc: 'Use the latest gem', default: true, type: :boolean

        HOST          = "http://d6r77u77i8pq3.cloudfront.net/releases"
        OSX_BINARY    = "traveling-ruby-20150715-2.2.2-osx.tar.gz"
        LINUX_BINARY  = 'traveling-ruby-20150715-2.2.2-linux-x86_64.tar.gz'
        LINUX_MY_SQL_GEM_FOLDER = "traveling-ruby-gems-20150715-2.2.2-linux-x86_64"
        BUILD_DIR     = 'packages/binary/build'
        GEM_SERVER    = 'http://0.0.0.0:8808'
        RESOURCES_DIR = BUILD_DIR     + '/resources'
        OSX_DIR       = BUILD_DIR     + '/osx'
        OSX_LIB_DIR   = OSX_DIR       + '/lib'
        OSX_APP_DIR   = OSX_LIB_DIR   + '/app'
        LINUX_DIR     = BUILD_DIR     + '/linux-x86_64'
        LINUX_LIB_DIR = LINUX_DIR     + '/lib'
        LINUX_APP_DIR = LINUX_LIB_DIR + '/app'

        HECKS_GEMS = %w(
          hecks-application
          hecks-adapters
          hecks-domain
        )

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
          fetch_hecks_gems
          package(OSX_APP_DIR, OSX_LIB_DIR, OSX_BINARY, OSX_DIR)
          package(LINUX_APP_DIR, LINUX_LIB_DIR, LINUX_BINARY, LINUX_DIR)
          run("cp #{OSX_APP_DIR}/Gemfile.lock #{LINUX_APP_DIR}")
          binding.pry
        end

        private

        def package(app_dir, lib_dir, binary, package_dir)
          empty_directory(app_dir)
          empty_directory(lib_dir + '/ruby')
          if refresh_cache?(app_dir)
            download_binary(binary, lib_dir) if options[:download]
            reduce_package_size(app_dir) if options[:reduce_package_size]
          end
          copy_resources(app_dir, package_dir)
          bundle_with_ruby_2_2_2(app_dir)
          # remove_native_extensions
          unpack_gem(app_dir)
        end

        def unpack_gem(app_dir)
          # run("tar -xzf #{RESOURCES_DIR}/#{MYSQL_GEM} -C #{app_dir}/vendor/ruby")
        end

        def remove_native_extensions
          run("rm -rf #{OSX_APP_DIR}/vendor/ruby/*/extensions")
          run("find #{OSX_APP_DIR}/vendor/ruby/*/gems -name '*.so' | xargs rm -f")
          run("find #{OSX_APP_DIR}/vendor/ruby/*/gems -name '*.bundle' | xargs rm -f")
          run("find #{OSX_APP_DIR}/vendor/ruby/*/gems -name '*.o' | xargs rm -f")
        end

        def refresh_cache?(app_dir)
          return true if !options[:cache]
          Dir[app_dir + '*'].empty?
        end

        def copy_resources(app_dir, package_dir)
          template "Gemfile", "#{RESOURCES_DIR}/Gemfile"
          run("cp -rf #{RESOURCES_DIR}/Gemfile #{app_dir}/Gemfile")
          run("cp -rf #{RESOURCES_DIR}/bundle #{app_dir}/.bundle")
          run("cp -rf #{RESOURCES_DIR}/#{domain_name}.rb #{app_dir}/#{domain_name}.rb")
          run("cp -rf #{RESOURCES_DIR}/wrapper #{package_dir}/#{domain_name}")
          run("cd #{package_dir} && chmod 744 #{domain_name}")
          run("cd #{package_dir} && chmod +x #{domain_name}")
        end

        def download_binary(binary, lib_dir)
          run("cd #{RESOURCES_DIR} && curl -O #{HOST}/#{binary}")
          run("tar -xzf #{RESOURCES_DIR}/#{binary} -C #{lib_dir}/ruby")
        end

        def bundle_with_ruby_2_2_2(app_dir)
          run("cp -rf #{RESOURCES_DIR}/Dockerfile #{app_dir}")
          run("cp #{domain_name}-0.0.0.gem #{app_dir}")
          run("cp #{RESOURCES_DIR}/*.gem #{app_dir}")
          run("cd #{app_dir} && docker build -t #{domain_name} --no-cache .")
          container = `cd #{app_dir} && docker create pizza_builder:latest`.gsub("\n", '')
          run("docker cp #{container}:/usr/src/app/vendor #{app_dir}")
        end

        def cache_folder
          `which hecks`.split('/')[0..-3].join('/') + '/cache'
        end

        def fetch_hecks_gems
          return unless options[:latest]

          HECKS_GEMS.each do |name|
            run("cd #{RESOURCES_DIR} && cp #{cache_folder}/#{name}-#{Hecks.version}.gem .")
          end
        end

        def reduce_package_size(app_dir)
          files = %w(test tests spec features benchmark README* CHANGE* Change*
            COPYING* LICENSE* MIT-LICENSE* TODO *.txt *.md *.rdoc doc docs
            example examples sample doc-api)

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

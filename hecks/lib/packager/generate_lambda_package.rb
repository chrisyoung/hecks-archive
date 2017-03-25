module Hecks
  module Packager
    module CLI
      class GenerateLambdaPackage < Thor::Group
        include Thor::Actions

        def self.source_root
          File.dirname(__FILE__) + '/templates'
        end

        def create_package_folder
          directory('lambda_package', './packages/lambda')
        end

        def domain_name
          Dir.pwd.split('/').last
        end

        def create_function
          run("rm -rf packages/lambda/#{domain_name}")
          run("cp -rf packages/binary/build/linux-x86_64 packages/lambda/#{domain_name}.production")
          run("cp -rf packages/binary/build/osx packages/lambda/#{domain_name}.dev")
        end
      end
    end
  end
end

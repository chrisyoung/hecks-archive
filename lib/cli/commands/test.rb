module Hecks
  class CLI < Thor
    desc 'test','Regenerate the examples and run the specs'
    def test
      exec(
        (
          reset_example('pizza_builder') +
          build_binary_package('pizza_builder') +
          build_lambda_package('pizza_builder') +
          generate_resource_server('pizza_builder') +
          ['rspec -f d']
        ).join("&&")
      )
    end

    private

    def reset_example(name)
      [
        "cd spec/examples/#{name}",
        'rm -rf lib',
        'rm -rf spec',
        'hecks new',
        'cd ../../..'
      ]
    end

    def build_binary_package(name)
      [
        "cd spec/examples/#{name}",
        'hecks package binary',
        'cd ../../..'
      ]
    end

    def build_lambda_package(name)
      [
        "cd spec/examples/#{name}",
        'hecks package lambda',
        'cd ../../..'
      ]
    end

    def generate_resource_server(name)
      [
        "cd spec/examples/#{name}",
        'rm -rf config.ru',
        'hecks generate resource_server',
        'cd ../../..'
      ]
    end
  end
end

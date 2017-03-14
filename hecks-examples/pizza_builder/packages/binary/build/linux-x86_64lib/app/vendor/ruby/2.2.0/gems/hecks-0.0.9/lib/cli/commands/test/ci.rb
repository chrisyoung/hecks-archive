class Test < Thor
  include Thor::Actions

  desc 'ci', 'Run the generators and tests for continuous integration'
  def ci
    reset_example('pizza_builder')
    build_binary_package('pizza_builder')
    build_lambda_package('pizza_builder')
    generate_resource_server('pizza_builder')
    examples
    run('rspec -f d')
  end

  desc 'examples', "run the example specs"
  def examples
    run('cd spec/examples/pizza_builder/adapters/sql_database&&rspec')
  end

  private

  def reset_example(name)
    run("cd spec/examples/#{name} && rm -rf lib")
    run("cd spec/examples/#{name} && rm -rf spec")
    run("cd spec/examples/#{name} && hecks new")
  end

  def build_binary_package(name)
    run("cd spec/examples/#{name} && hecks package binary")
  end

  def build_lambda_package(name)
    run("cd spec/examples/#{name} && hecks package lambda")
  end

  def generate_resource_server(name)
    run("cd spec/examples/#{name} && rm -rf config.ru")
    run("cd spec/examples/#{name} && hecks generate resource_server")
    run("cd spec/examples/#{name} && cd ../../..")
  end
end

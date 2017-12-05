# Creates and executes serverless commands and returns the results
class Runner
  attr_reader :command, :command_name, :result

  def initialize(command_name:)
    @command_name = command_name
  end

  def call
    run_command
    parse_result
    self
  end

  private

  attr_reader :raw

  def parse_result
    return if raw.include? "null"
    @result = JSON.parse(raw, symbolize_names: true)
  end

  def run_command
    @raw = `#{command}`
  end

  def command
    [
      "cd example/pizza_builder",
      "&&",
      "serverless invoke",
      "local -f",
      "pizzas_#{ command_name }"
    ].join(" ")
  end
end

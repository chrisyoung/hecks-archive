# frozen_string_literal: true
class CommandRunner
  def initialize(hexagon, name, dry_run = false)
    @hexagon = hexagon
    @dry_run = dry_run
    @name    = name
  end

  def call(command)
    output = full_command(command)
    File.open('tmp/hecks', 'a') { |file| file.write(output + "\n")  }
    return if dry_run
    # puts("\n", `#{output}`, "\n")
  end

  private

  attr_reader :hexagon, :dry_run, :name

  def full_command(command)
    (['hecks'] + command).join(' ')
  end
end

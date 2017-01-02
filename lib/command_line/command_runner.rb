# frozen_string_literal: true
class CommandRunner
  def initialize(hexagon, name, dry_run = false)
    @hexagon = hexagon
    @dry_run = dry_run
    @name    = name
  end

  def call(command, options = { from_domain_dir: true })
    output = full_command(command, options)
    puts "$ #{output}"
    return if dry_run
    puts("\n", `#{output}`, "\n")
  end

  private

  attr_reader :hexagon, :dry_run, :name

  def full_command(command, options)
    (
      from_hexagon_dir_if(options[:from_domain_dir]) + ['hecks'] + command
    ).join(' ')
  end

  def from_hexagon_dir_if(statement)
    return [] unless statement
    ['cd', name.to_s, '&&']
  end
end

class CommandRunner
  def initialize(hexagon, dry_run=false)
    @hexagon = hexagon
    @dry_run = dry_run
  end

  def call(command, options={from_hex_dir: true})
    puts full_command(command, options)
    puts("\n", `#{full_command(command, options)}`, "\n") unless dry_run
  end

  private

  attr_reader :hexagon, :dry_run

  def full_command(command, options)
    (from_hexagon_dir_if(options[:from_hex_dir]) + ['hecks'] + command).join(' ')
  end

  def from_hexagon_dir_if(statement)
    return [] unless statement
    ['cd', "#{hexagon.name}_hexagon", '&&']
  end
end

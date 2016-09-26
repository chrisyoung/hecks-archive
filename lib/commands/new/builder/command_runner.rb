class CommandRunner
  def initialize(hexagon, name, dry_run=false)
    @hexagon = hexagon
    @dry_run = dry_run
    @name = name
  end

  def call(command, options={from_hex_dir: true})
    puts full_command(command, options)
    puts("\n", `#{full_command(command, options)}`, "\n") unless dry_run
  end

  private

  attr_reader :hexagon, :dry_run, :name

  def full_command(command, options)
    (from_hexagon_dir_if(options[:from_hex_dir]) + [hecks_command(options)] + command).join(' ')
  end

  def from_hexagon_dir_if(statement)
    return [] unless statement
    ['cd', "#{name}_hexagon", '&&']
  end

  def hecks_command(options)
    if options[:from_hex_dir]
      '../../bin/hecks'
    else
      '../bin/hecks'
    end
  end
end

class CommandRunner
  def initialize(hexagon, dry_run=false)
    @hexagon = hexagon
    @dry_run = dry_run
  end

  def call(command)
    puts full_command(command)
    puts("\n", `#{full_command(command)}`, "\n") unless dry_run
  end

  private

  attr_reader :hexagon, :dry_run

  def full_command(command)
    (['cd', "#{hexagon.name}_hexagon", '&&', 'hecks'] + command).join(' ')
  end
end

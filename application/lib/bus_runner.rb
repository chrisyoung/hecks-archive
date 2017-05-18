class HecksApplication
  # Empties the command bus in a seperate thread.

  BUS_RUNNER_THREAD = Thread.new do
    while true do
      next if HecksApplication::CommandBus.empty?
      HecksApplication::CommandBus.run
    end
  end
end

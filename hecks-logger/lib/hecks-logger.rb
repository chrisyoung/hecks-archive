# frozen_string_literal: true

# Simple logger
class HecksLogger
  def initialize(output: [])
    @output = output
  end

  def method_missing(name, *args, &block)
    @output << {name: name, command: args.first.to_h.to_s}.to_s
  end

  def respond_to?(name)
    true
  end
end

require 'bundler'
Bundler.require

require_relative 'args'
require_relative 'compatibility/fixnum'
require_relative 'app_runner'

HecksApp = load('Hecksfile')
AppRunner.new(args: ARGV, application: HecksApp).call

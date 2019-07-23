require 'singleton'
require 'pry'
require 'erubis'
require_relative 'next_domain/support'


require_relative 'next_domain/parser'
require_relative 'next_domain/activator'

require_relative 'next_domain/file_maker'

class NextDomain
  def initialize(name, &block)
    @parser = Parser.new(name, &block)
    @file_maker = FileMaker
  end

  def activate
    Activator.call(@parser.domain)
  end

  def dump
    FileMaker.dump(@parser.domain)
  end
end

def next_domain name, &block
  NextDomain.new name, &block
end
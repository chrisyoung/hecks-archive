require 'singleton'
require 'pry'
require 'erubis'
require_relative 'next_domain/domain_object'
require_relative 'next_domain/aggregate'
require_relative 'next_domain/activator'
require_relative 'next_domain/support/string'

class NextDomain
  attr_reader :name, :aggregates
  attr_accessor :ruby_file
  
  def initialize(name, &block)
    @name = name
    @aggregates = []
    @files = []
    instance_eval &block
  end

  def aggregate(name, &block)
    @aggregates << Aggregate.new(name, self, &block)
  end

  def get_binding
    binding
  end

  def activate
    Activator.call(self)
    self
  end

  def print
    Activator.print
  end

  def dump
    File.open(file_name, 'w') do |file|
      file.write(ruby_file + "\n")
    end
    FileUtils.mkdir_p(folder_name)
    
    aggregates.each do |aggregate|
      File.open(folder_name + "/" + aggregate.file_name, 'w') do |file|
        file.write(aggregate.ruby_file + "\n")
      end
      FileUtils.mkdir_p(folder_name + "/" + aggregate.folder_name)
      
      aggregate.domain_objects.each do |domain_object|
        File.open(folder_name + "/" + aggregate.folder_name + "/" + domain_object.file_name, 'w') do |file|
          file.write(domain_object.ruby_file + "\n")
        end
      end
    end
  end

  def file_name
    folder_name + '.rb'
  end

  def folder_name
    @name.to_s.downcase
  end

  class Entity < DomainObject;end
  class ValueObject < DomainObject;end  
end

def next_domain name, &block
  NextDomain.new name, &block
end
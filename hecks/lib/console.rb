require 'irb'
require "irb/completion"
require_relative 'console/commands'

module Hecks
  module Console
    def self.file
      Dir.pwd.split('/').last
    end

    def self.full_path
      Dir.pwd + "/lib/" + file
    end

    def self.domain
      file.camelize.constantize
    end

    def self.domain_name
      domain.to_s
    end
  end
end

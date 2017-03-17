module Hecks
  module Domain
    class DomainBuilder
      class DomainModule
        attr_reader :objects, :name, :references

        def initialize(name:)
          @name = name
          @objects = []
          @references = []
        end

        def head(name=nil)
          return (@objects << Head.new(name: name)).last if name
          objects.find{ |o| o.is_a?(Head) }
        end

        def value(name)
          (@objects << Value.new(name: name)).last
        end

        def reference(name)
          (@references << Reference.new(name)).last
        end
      end
    end
  end
end

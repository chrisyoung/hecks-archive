module HecksPlugins
  class JSONValidator
    class SchemaParser
      attr_reader :schema

      def initialize(head_spec:)
        @head_spec = head_spec
        @properties = {}
      end

      def call
        parse_required_fields
        parse_properties
        build_schema
        self
      end

      private

      attr_reader :required_fields, :head_spec, :properties

      def build_schema
        @schema = {
          "type"       => "object",
          "required"   => required_fields,
          "properties" => properties
        }
      end

      def parse_required_fields
        @required_fields = head_spec.attributes.map{ |a| a.name }
      end

      def parse_properties
        head_spec.attributes.each do |a|
          type = a.type.downcase
          type = 'array' if a.list?
          properties[a.name] = {"type" => type}
        end
      end
    end
  end
end

module HecksPlugins
  class JSONValidator
    # Create a JSON Schema from the head_spec
    class SchemaParser
      attr_reader :schema
      JSON_TYPES = %w{string number object array boolean null}
      HECKS_NUMBER_TYPES = %w{integer currency}

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

      def get_json_type(type)
        result = type.downcase
        return 'object' unless JSON_TYPES.include?(result)
        return 'number' if HECKS_NUMBER_TYPES.include?(result)
        result
      end

      def parse_properties
        head_spec.attributes.each do |a|
          json_type = get_json_type(a.type)
          properties[a.name] = {"type" => a.list? ? 'array' : json_type}
        end
      end
    end
  end
end

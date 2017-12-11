require 'form_helper_extension/model'
require 'form_helper_extension/model_name'
require 'form_helper_extension/register_models'

module HecksAdapters
  module Rails
    # Extend hecks models to play nice with Rails form helpers
    module FormHelperExtension
      def model_name
        ModelName.new(model_name_as_string, id)
      end

      def model_name_as_string
        self.class.to_s.split("::").last.downcase
      end

      def to_key
        model_name_as_string
      end

      def to_model
        Model.new(model_name_as_string, !id.nil?, id)
      end
    end
  end
end

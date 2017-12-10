require 'model'
require 'model_name'

module HecksFormHelperExtension
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
    Model.new(model_name_as_string, !id.nil?)
  end
end

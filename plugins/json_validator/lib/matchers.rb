#
module HecksPlugins
  class JSONValidator
    MATCHERS = [
      {
        regex:   /did not contain a required property of '(.*)' in schema/,
        message: 'Missing'
      },
      {
        regex: /The property '#\/(.*)' of type (.*) did not match the following type: (.*) in schema/,
        message: 'Type mismatch. Got \'%s\', should have been \'%s\''
      }
    ]
  end
end

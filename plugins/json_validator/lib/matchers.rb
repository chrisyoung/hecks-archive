#
module HecksPlugins
  class JSONValidator
    # These matchers create a cleaner, more user-friendly message out of the
    # messages returned by json-schema
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

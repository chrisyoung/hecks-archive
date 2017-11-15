module HecksPlugins
  class JSONValidator
    MATCHERS = [
      {
        regex:   /did not contain a required property of '(.*)'/,
        message: 'missing'
      }
    ]
  end
end

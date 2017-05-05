var environment = require('./environment')

module.exports = function (context, event, command) {
  return "package/" + environment(context['functionName']) + "/app -m pizzas -c " + command + " -d '" + JSON.stringify(event) + "'"
}

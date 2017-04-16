'use strict';
const exec = require('child_process').exec
var environment = require('./environment')

module.exports.create = (event, context, callback) => {
  var command = "package/" + environment(context['functionName']) + "/app -m orders -c create -d '" + JSON.stringify(event) + "'"
  exec(command, (err, stdout, stderr) => {
    if (err) { console.error(err); return }
    var result = JSON.parse(stdout)
    console.error(stderr)
    const response = {
      statusCode: Object.keys(result.errors).length > 0 ? 500 : 200,
      body: { message: 'create command called on the orders module', input: event, result: result, errors: result['errors']}
    };
    callback(null, response);
  });
};

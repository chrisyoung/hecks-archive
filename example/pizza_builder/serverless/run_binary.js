module.exports = function(command, module, err, stdout, stderr, event) {
  if (err) { console.error(err); return }
  var result = JSON.parse(stdout)

  if(result && result.errors) {
    var statusCode = Object.keys(result.errors).length > 0 ? 500 : 200
  } else {
    var statusCode = 200
  }

  return {
    statusCode: statusCode,
    body: {
      command: command,
      module: module,
      input: event,
      result: result,
      errors: []
    }
  };
}

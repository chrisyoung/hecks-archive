module.exports = function(command, module, err, stdout, stderr, event) {
  if (err) { console.error(err); return }
  var result = JSON.parse(stdout)

  return {
    statusCode: Object.keys(result.errors).length > 0 ? 500 : 200,
    body: {
      command: command,
      module: module,
      input: event,
      result: result,
      errors: result['errors']
    }
  };
}

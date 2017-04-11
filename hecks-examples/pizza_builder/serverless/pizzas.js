'use strict';
const exec = require('child_process').exec

module.exports.create = (event, context, callback) => {
  var command = 'package/osx/app pizzas create \'' + JSON.stringify(event) + "'"

  exec(command, (err, stdout, stderr) => {
    if (err) { console.error(err); return }

    var result = JSON.parse(stdout)
    console.log(stderr)
    const response = {
      statusCode: stderr ? 500 : 200,
      body: { message: 'create command called on the pizzas module', input: event, result: result, errors: result['errors']}
    };
    callback(null, response);
  });
};

module.exports.read = (event, context, callback) => {
  const response = {
    statusCode: 200,
    body: JSON.stringify({ message: 'Read', input: event }),
  };

  callback(null, response);
};

module.exports.update = (event, context, callback) => {
  const response = {
    statusCode: 200,
    body: JSON.stringify({ message: 'Update', input: event }),
  };

  callback(null, response);
};

module.exports.delete = (event, context, callback) => {
  const response = {
    statusCode: 200,
    body: JSON.stringify({ message: 'Delete', input: event}),
  };

  callback(null, response);
};

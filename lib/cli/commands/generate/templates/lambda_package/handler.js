'use strict';

const spawn = require('child_process').spawn;

module.exports.hello = (event, context, callback) => {
  var command = './pizza_builder/pizza_builder pizzas ' + "'" + JSON.stringify(event) + "'"
  const child = exec(command, (result) => {
        // Resolve with result of process
        context.done(result);
    });

  // child.stdout.on('data', function (data) { console.log("stdout:\n"+data); });
  // child.stderr.on('data', function (data) { console.log("stderr:\n"+data); });
};

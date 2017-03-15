'use strict';

const spawn = require('child_process').spawn;

module.exports.pizza_builder = (event, context, callback) => {
  var app = 'pizza_builder/pizza_builder'
  var data = JSON.stringify(event['data'])
  var command = app + ' ' + event['module'] + ' ' + event['method'] + ' ' + JSON.stringify(data)
  const child = exec(command, (result) => {
    context.done(result);
  });
};

'use strict';

var invokeRubyApp = "./pizza_builder/pizza_builder";
const spawn = require('child_process').spawn;

module.exports.hello = (event, context, callback) => {
  var child = spawn(invokeRubyApp, [JSON.stringify(event, null, 2), JSON.stringify(context, null, 2)]);
  // const response = {
  //   statusCode: 200,
  //   body: JSON.stringify({
  //     message: 'Go Serverless v1.0! Your function executed successfully!',
  //     input: event,
  //   }),
  // };

  child.stdout.on('data', function (data) { console.log("stdout:\n"+data); });
  child.stderr.on('data', function (data) { console.log("stderr:\n"+data); });

  // callback(null, response);

  // Use this code if you don't use the http event with the LAMBDA-PROXY integration
  // callback(null, { message: 'Go Serverless v1.0! Your function executed successfully!', event });
};

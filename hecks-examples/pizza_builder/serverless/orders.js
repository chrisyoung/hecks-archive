'use strict';

module.exports.create = (event, context, callback) => {
  const response = {
    statusCode: 200,
    body: JSON.stringify({
      message: 'Create',
      input: event,
    }),
  };

  callback(null, response);
};

module.exports.read = (event, context, callback) => {
  const response = {
    statusCode: 200,
    body: JSON.stringify({
      message: 'Read',
      input: event,
    }),
  };

  callback(null, response);
};

module.exports.update = (event, context, callback) => {
  const response = {
    statusCode: 200,
    body: JSON.stringify({
      message: 'Update',
      input: event,
    }),
  };

  callback(null, response);
};

module.exports.delete = (event, context, callback) => {
  const response = {
    statusCode: 200,
    body: JSON.stringify({
      message: 'Delete',
      input: event,
    }),
  };

  callback(null, response);
};

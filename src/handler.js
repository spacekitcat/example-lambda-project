import readQuotes from './quote-store';

exports.handler = function(event, context, callback) {
  console.log('Lambda start');

  const response = {
    statusCode: 200,
    body: JSON.stringify({
      message: readQuotes()[2]
    })
  };

  console.log('Lambda end');
  callback(null, response);
};

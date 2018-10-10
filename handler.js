exports.handler = function(event, context, callback) {
  console.log('Lambda start');

  const response = {
    statusCode: 200,
    body: JSON.stringify({
      message: 'Buy the ticket, take the ride.'
    })
  };

  console.log('Lambda end');
  callback(null, response);
};

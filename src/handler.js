import lambdaGetCommand from './lambda-get-command';

exports.handler = function (event, context, callback) {
  console.log('Lambda start');
  callback(null, lambdaGetCommand.execute());
  console.log('Lambda end');
};

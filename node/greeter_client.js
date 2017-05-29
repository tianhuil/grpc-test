var messages = require('./proto/helloworld_pb');
var services = require('./proto/helloworld_grpc_pb');

var grpc = require('grpc');

function main() {
  var client = new services.GreeterClient('localhost:50051',
                                          grpc.credentials.createInsecure());
  var request = new messages.HelloRequest();
  var user;
  if (process.argv.length >= 3) {
    user = process.argv[2];
  } else {
    user = 'world';
  }
  request.setName(user);
  client.sayHello(request, function(err, response) {
    console.log('Greeting:', response.getMessage());
  });
}

main();

var express = require('express');
var app = express();
var server = app.listen(5000, listen);

function listen() {
	var host = server.address().address;
	var port = server.address().port;

	console.log('App listening at http://' + host + ':' + port);
}

app.use(express.static('public'));

var io = require('socket.io')(server);

io.sockets.on('connection', function(socket){
	console.log("New Client: " + socket.id);

	socket.on('mouse', function(data){
		console.log("Recieved: 'mouse' " + data.x + " " + data.y);

		socket.broadcast.emit('mouse', data);
	});

	socket.on('disconnect', function() {
		console.log("Client has disconnected");
	});
});


const express = require('express');
const http = require('http');
const socketIo = require("socket.io");

const port = process.env.PORT || 4001;
const app = express();
const server = http.createServer(app);
const io = socketIo(server);

app.use(express.static(__dirname + '/css'));

app.get('/', function(req, res) {
    res.sendFile(__dirname + '/index.html');
});

// Setup Client Counter
var numClients = 0;

io.on('connection', function(socket) {
    numClients++;
    io.emit('stats', numClients);
    console.log('Connected clients:', numClients);
    socket.on('disconnect', function() {
        numClients--;
        io.emit('stats', numClients);
        console.log('Connected clients:', numClients);
    });
});

server.listen(port, () => console.log(`Listening on port ${port}`));
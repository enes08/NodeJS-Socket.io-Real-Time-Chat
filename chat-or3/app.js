var express = require('express')
  , app = express()
  , http = require('http')
  , server = http.createServer(app)
  , io = require('socket.io').listen(server);
  
var usernames = {};
var connectedUsers = {};


var people={};
var onlinePeople=0;

io.sockets.on('connection', function (socket) {
  onlinePeople+=1;
  io.sockets.emit('onlinepeople', onlinePeople);

  // when the client emits 'sendchat', this listens and executes
  socket.on('sendchat', function (data) {
    // we tell the client to execute 'updatechat' with 2 parameters
    console.log("name"+socket.username+"TO=>"+data.to);

    

    io.to(people[data.to]).emit('updatechat', socket.username, data);
    io.to(people[socket.username]).emit('updatechat', socket.username, data);


    console.log("name"+socket.username+"id=>"+socket.id);
   // io.sockets.emit('updatechat', socket.username, data);
   // connectedUsers.hakan.emit('updatechat', socket.username, data);
    
  });

  // when the client emits 'adduser', this listens and executes
  socket.on('adduser', function(username){
    // we store the username in the socket session for this client
    socket.username = username;
    people[socket.username] =  socket.id;

    // add the client's username to the global list
    usernames[username] = username;
    // echo to client they've connected
    var data={};
    data.message=username+' you have connected'
    socket.emit('updatechat', 'SERVER',data);
    // echo globally (all clients) that a person has connected
   
    //socket.broadcast.emit('updatechat', 'SERVER' , ' has connected');
    // update the list of users in chat, client-side
    io.sockets.emit('updateusers', usernames);
  });

  // when the user disconnects.. perform this
  socket.on('disconnect', function(){
    // remove the username from global usernames list
    onlinePeople-=1;
    delete usernames[socket.username];
    // update list of users in chat, client-side
    io.sockets.emit('updateusers', usernames);
    io.sockets.emit('onlinepeople', onlinePeople);

    // echo globally that this client has left
    socket.broadcast.emit('updatechat', 'SERVER', socket.username + ' has disconnected');
  });
});
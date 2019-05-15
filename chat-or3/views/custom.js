	// on load of page
    $(document).ready(function(){

        $(".userlist").on("click","li",function(e){

             $("#conversation").text("");

              $( "li" ).each(function( i ) {
               $(this).css("background-color", "#666666");

               $(this).removeAttr("data");


                 });

           $(this).attr("data", "checked");
           $(this).css("background-color", "#ffffff");

        $('#conteiner').show();
            });

var socket = io.connect('http://localhost:3000');


var userAd=$('#usrname').text();

// on connection to server, ask for user's name with an anonymous callback
socket.on('connect', function(){
   // call the server-side function 'adduser' and send one parameter (value of prompt)
   //socket.emit('adduser', prompt("What's your name?"));

   socket.emit('adduser',userAd);
});




// listener, whenever the server emits 'updatechat', this updates the chat body
socket.on('updatechat', function (username, data) {
   $('#conversation').append('<b>'+username + ':</b> ' + data.message + '<br>');
});


socket.on('onlinepeople', function (onlinepeople) {

   $('#onlinepeople').text(onlinepeople);
});

     

// listener, whenever the server emits 'updateusers', this updates the username list
socket.on('updateusers', function(data) {
   $('#users').empty();
   $.each(data, function(key, value) {
       $('#users').append('<li class="user">' + key + '</li>');
   });
});


   // when the client clicks SEND
   $('#datasend').click( function() {
 var data={};

  data.message = $('#data').val();
  data.userId=$('#usrID').text();

         $( "li" ).each(function( i ) {
                  
           var term = $(this).attr('data');



           if(term=="checked"){

               data.to= $(this).text();

           }

                });



       $('#data').val('');
       // tell server to execute 'sendchat' and send along one parameter
       socket.emit('sendchat', data);
   });

   // when the client hits ENTER on their keyboard
   $('#data').keypress(function(e) {
       if(e.which == 13) {
           $(this).blur();
           $('#datasend').focus().click();
       }
   });
});
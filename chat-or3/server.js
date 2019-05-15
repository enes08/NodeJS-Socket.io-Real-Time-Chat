
var express = require('express')
  , app = express()
  , http = require('http')
  ,path=require("path")
  , server = http.createServer(app)
  , io = require('socket.io').listen(server);
  var _=require("underscore");
  var bodyParse=require("body-parser");
server.listen(3000);
//app.engine('html', require('ejs').renderFile);
app.set('view engine', 'ejs');

var myDB=require("./db");
var socket=require("./socket");

myDB.connect();
/*********************** */
socket.socketCreate(io);

/********************** */

app.use(bodyParse.urlencoded({extended: true}));
//var midleware=require("./middleware/midleware");
app.use(express.static(path.join(__dirname, 'views')));

app.use(bodyParse.json());



app.get('/', function (req, res) {
    res.render('login',{

        error:"abc"

    });
});

app.get("/users",function(req,res){
    myDB.getAllUser().then(user=>{

        res.json(user);

    }).catch(err=>{

        res.send("hata var"+err);
    })
    

})


app.post("/insertUser",function(req,res){

    let body=_.pick(req.body,"username","email","pwd");

    if(body.email==""||body.pwd==""||body.username==""){
        res.render('login',{

            error:"abc"
    
        });

    }else{
        myDB.insertUser(body).then(messages=>{
 
            //res.json(messages);
            res.render('login',
            {
               error:false,
                message:"kayıt İŞlemi başarılı"
   
            });
   
    
        }).catch(err=>{
    
           res.render('login',
           {
               error:true,
               message:"kayıt İŞlemi başarısız"
   
           });
   
       })
        

    }
    
  
 
 })



app.post("/sendMessage",function(req,res){

   let message=_.pick(req.body,"user_id_fk","reply","c_id_fk");
   
    myDB.sendMessage(message).then(messages=>{

        res.json(messages);

    }).catch(err=>{

        res.send("hata var"+err);
    })
    

})

app.get("/getConversationMessaga",function(req,res){

    var c_id = req.query.c_id;
    var ofset = req.query.ofset;

    myDB.getConversationMessaga(c_id,ofset).then(messages=>{

        res.json(messages);

    }).catch(err=>{

        res.send("hata var"+err);
    })
    

})

app.post("/login",function(req,res){

    
    let body=_.pick(req.body,"email","pwd");

    if(body.email==""||body.pwd==""){
        res.render('login',{

            error:"abc"
    
        });

    }else{

        var conversationList={};
        var mUser="";
    
    
        console.log(body);
    
        myDB.login(body.email,body.pwd).then(user=>{
          
            //res.sendfile(__dirname + "/index.html",user);
    
            mUser=user[0].user_id;
    
            myDB.getConvertationUsers(user[0].user_id).then(convertationlist=>{
    
                conversationList=convertationlist;
    
    
                Promise.all(
                    convertationlist.map(function(post) {
                     return new Promise(function(res){
        
                        myDB.getConvertationLastMessage(post.c_id).then(message=>{
    
                            //console.log("userMessage=>>"+JSON.stringify(message));
                            res(message);
    
                        })
    
        
                     });
                   })
                   ).then(function(convertationlistMessage){
    
                             console.log("USER ID=>>>>>>>LOOO"+mUser);
                    
                    myDB.getAllUser(mUser).then(allusers=>{
                       
                        console.log("userMessage=>>"+JSON.stringify(allusers));
    
                        res.render('index2', 
                        {  
                            masterUser:mUser,
                            muser:user,
                            allUser:allusers,
                            conversationusers:conversationList,
                            conversationLastMessage:convertationlistMessage
                        });
                         res.end();
                    })
                    
                   
                    
                   
                   });
        
                
    
    
            }).catch(err=>{
                console.log(err);
    
                res.render('login',{
    
                    error:"abc"
            
                });
            })
    
        
            //res.json();
    
        }).catch(err=>{
    
    res.render('login',{
    
            error:"abc"
    
        });        console.log(err);
    
        })

    }

   
    

})



app.post("/addConversationUsers",function(req,res){

    let message=_.pick(req.body,"user_one","user_two");

    myDB.addConversation(message).then(result=>{
        res.send(result);


    }).catch(err=>{

        res.send("hata var"+err);
    })

    })

app.post("/users",function(req,res){

    let body=_.pick(req.body);

    myDB.connect();
    myDB.insert(req.body).then(user=>{
        res.send("Ekleme işlemi başarılı");


    }).catch(err=>{

        res.send("hata var"+err);
    })

    })
    
app.put("/users/:id",function(req,res){

    let todoId=req.params.id;
     
    let body=_.pick(req.body,"description","completed");
    

})

app.delete("/users/:id",function(req,res){
    let todoId=req.params.id;



})




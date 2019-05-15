var mysql      = require('mysql');

var db=mysql.createConnection({
    host     : 'localhost',
    user     : 'root',
    password : '',
    database : 'chat'
  });


module.exports.connect=function(){

     return new Promise(function(resolve,reject){

      
        db.connect(function(err) {
            if (err) {
              console.error('error connecting: ' + err.stack);
               reject(err);
            }
           
            resolve('connected as id ' + db.threadId);
          });


     })


};




module.exports.insertUser=function(users){

    return new Promise(function(resolve,reject){

        db.query("select * from users where email='"+ users.email+"'",function(err,result){

              console.log("KİŞİ EKLEME"+ JSON.stringify( result));

            if(result==""){


                
    if(users.email!=""&&users.pw!=""&&users.username!=""){

        db.query("INSERT INTO users SET ?", users, function (error, results, fields) {
            if (error) {
                reject(error);

            }else
            {
                resolve(results);

            }
            
                    });

    }

                

            }else{
                reject("kişi daha önce eklenmiş");


            }

        })


        
})


}


module.exports.getAllUser=function(){

    return new Promise(function(resolve,reject){


        db.query("Select * from users", function (error, results, fields) {
            if (error) {
                reject(error);

            }else
            {
                resolve(results);

            }
            
                    });
})


}




module.exports.sendMessage=function(message){

    return new Promise(function(resolve,reject){


        db.query('INSERT INTO conversation_reply  SET ?', message, function (error, results, fields) {
            if (error) {
                reject(error);

            }else
            {
                resolve(results);

            }
            
                    });
})


}



module.exports.addConversation=function(conversation){


    return new Promise(function(resolve,reject){

        db.query("SELECT c_id FROM conversation WHERE (user_one='"+conversation.user_one+"' and user_two='"+conversation.user_two+"') or (user_one='"+conversation.user_two+"' and user_two='"+conversation.user_one+"')",function(err,result){


            if(result!=""){

                reject("kişi daha önce eklenmiş");
            }
            else{

                db.query('INSERT INTO conversation SET ?', conversation, function (error, results, fields) {
                    if (error) {
                        reject(error);
        
                    }else
                    {
                        resolve(results);
        
                    }
                    
                            });
            }


            if(err){
                reject(err);
            }

        })


      
})


}

module.exports.getConversationMessaga=function(conversation_id,ofset){

    return new Promise(function(resolve,reject){


        db.query("SELECT * FROM (SELECT R.cr_id,R.time,R.reply,U.user_id,U.username,U.email FROM users U, conversation_reply R WHERE R.user_id_fk=U.user_id and R.c_id_fk='"+conversation_id+"' ORDER BY R.cr_id DESC LIMIT 20 OFFSET "+ofset+") R ORDER BY R.cr_id", function (error, results, fields) {
            if (error) {
                reject(error);

            }else
            {
                resolve(results);

            }
            
                    });
})


}


module.exports.getAllUser=function(user_id){

    return new Promise(function(resolve,reject){


        db.query("SELECT * FROM users where user_id!='"+user_id+"'", function (error, results, fields) {
            if (error) {
                reject(error);

            }else
            {
                resolve(results);

            }
            
                    });
})


}

module.exports.getConvertationLastMessage=function(conversation_id){

    return new Promise(function(resolve,reject){


        db.query("SELECT R.cr_id,R.time,R.reply FROM conversation_reply R WHERE R.c_id_fk='"+conversation_id+"' ORDER BY R.cr_id DESC LIMIT 1", function (error, results, fields) {
            if (error) {
                reject(error);

            }else
            {
                resolve(results);

            }
            
                    });
})


}
module.exports.getConvertationUsers=function(UserId){

    return new Promise(function(resolve,reject){


        db.query("SELECT u.user_id,c.c_id,u.username,u.email FROM conversation c, users u  WHERE (CASE WHEN c.user_one = '"+UserId+"' THEN c.user_two = u.user_id  WHEN c.user_two = '"+UserId+"' THEN c.user_one= u.user_id   END)  AND ( c.user_one ='"+UserId+"' OR c.user_two ='"+UserId+"' )  Order by c.c_id DESC Limit 20", function (error, results, fields) {
            if (error) {
                reject(error);

            }else
            {
                resolve(results);

            }
            
                    });
})


}

module.exports.login=function(email,pwd){

    return new Promise(function(resolve,reject){

        db.query("Select * from users WHERE email='"+email+"' and pwd='"+pwd+"'" , function (error, results, fields) {
            if (error) {
                console.log("kullanıcı bulunamadı"+error);

                reject(error);

            }else
            {
                console.log("login result"+JSON.stringify(results));

                resolve(results);

            }
            
                    });
})


}



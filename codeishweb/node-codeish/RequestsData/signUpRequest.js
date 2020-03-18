const express = require("express");
const signUpRouter = express.Router();
const mysqlConnection = require("../mysqlConnection/connections");


signUpRouter.post("/register",(req,res,err)=>{
  //var queryParam = req.query
  //res.json(queryParam);
  //res.send(`<h1><u> Hello From A Trackit Driver name ${req.params.name} </u></h1>`);

  // Get Names From The Requested Data In Post
  var name = req.params.name
  var email = req.params.email
  var password = req.params.password
  var pic = req.params.pic
  var frnKeyId = req.params.frnKeyId

  console.log(req.query);


  console.log(" inside /drivers");
    mysqlConnection.query(`INSERT INTO users (name, email, password, pic, frnKeyId) VALUES (${name}, ${email}, ${password}, ${pic}, ${frnKeyId})`,(err,rows,fields)=>{
        if(!err){
            //res.send(rows);
              res.json("Registration Succeeded");
        }else{
            console.log("This Is The Error logs [\n" +err +"\n]");
            res.json("Registration Failed");
        }
    });
  });

module.exports = signUpRouter

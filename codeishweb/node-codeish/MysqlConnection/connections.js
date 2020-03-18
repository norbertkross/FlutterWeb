const mysql = require("mysql");

var mysqlConnection = mysql.createConnection({
    host:"localhost",// or replace with server ip address
    user:"root",
    password:"",
    database: "codeishweb",
    multipleStatements: true,
});

mysqlConnection.connect((err)=>{
    if(!err){
        console.log("Succeeded");
    }else{
        console.log("connection failed");
    }
});

module.exports = mysqlConnection;

var express = require('express')
var app = express()
const http = require('http').createServer(app)

// User Defined ROutes
const register = require('./RequestsData/signUpRequest')

//app.use(driverRouter)
app.get('/', (req, res,err) => {
    res.send("<h1>Node Server is running. Yay!! <h1>")
  });

app.use(register)


app.get('*', function(req, res){
  res.status(404).send(' Resource Not Found ');
});

// connect With HTTP and listen On Port 3000 or Available PORT
    http.listen(
      process.env.PORT || 3000,()=>{
      console.log("running on port 3000");
    })

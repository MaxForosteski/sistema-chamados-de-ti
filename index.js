const path = require("path");
const express = require("express");
const fs = require("fs");

const app = express();
const server = require("http").Server(app);


app.get('/', (req,res)=>{
    console.log("teste");
    res.sendFile(__dirname + '/public/client/src/index.html'); 
});

app.use('/public',express.static(__dirname + '/public'));

app.listen(3000, (err) => {
    if (err) {console.log(err)}
    console.log('listening on port 3000');
})


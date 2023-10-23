const http = require("http");
const express = require("express");
const fs = require("fs")

const app = express();

http.createServer((req,res)=>{
    app.get('/', (req,res)=>{
        res.sendFile('client/src/index.html');
    })
}).listen(3000, () => {
    console.log('listening on port 3000');
})


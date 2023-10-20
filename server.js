const http = require("http");
const express = require("express");
const fs = require("fs")

const app = express();

http.createServer((req,res)=>{
    fs.readFile('client/src/index.html', (err,data) => {
        res.writeHead(200, {'Content-Type': 'text/html'});
        res.write(data);
        return res.end();
    });
}).listen(3000, () => {
    console.log('listening on port 3000');
})


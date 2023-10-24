const express = require("express");

const app = express();
const server = require("http").Server(app);


app.get('/', (req,res)=>{
    console.log("teste");
    res.sendFile(__dirname + '/views/index.html'); 
});

app.use('/public',express.static(__dirname + '/public'));

app.listen(3000, (err) => {
    if (err) {console.log(err)}
    console.log('listening on port 3000');
})


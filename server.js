var http = require('http');
var https = require('https');
var express = require('express');
var fs = require('fs');
var app = express();
var router = require('./router/main')(app);

var options = {
    key: fs.readFileSync('fake-keys/key.pem'),
    cert: fs.readFileSync('fake-keys/cert.pem')
};

var portForHttp = 8000;
var portForHttps = 8001;

app.set('views', __dirname + '/view');
app.set('view engine', 'ejs');
app.engine('html', require('ejs').renderFile);

http.createServer(app).listen(portForHttp, function() {
  console.log("Http server listening on port [" + portForHttp + "]");
});

https.createServer(options, app).listen(portForHttps, function() {
  console.log("Https server listening on port [" + portForHttps + "]");
});
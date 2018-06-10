// set up ======================================================================
var express = require('express');
var app = express(); 
var port = 8081
//var mongoose = require('mongoose');
var bodyParser = require('body-parser');
var methodOverride = require('method-override');

//mongoose.connect('mongodb://localhost:27017/test');


//var db = mongoose.connection;
//db.on('error', console.error.bind(console, 'connection error:'));
//db.once('open', function() {
//  console.log ("we're connected!");
//});

//module.exports = db

app.use(express.static('./public'));            // set the static files location /public/img will be /img for users
app.use(bodyParser.urlencoded({'extended': 'true'})); // parse application/x-www-form-urlencoded
app.use(bodyParser.json()); // parse application/json
app.use(bodyParser.json({type: 'application/vnd.api+json'})); // parse application/vnd.api+json as json
app.use(methodOverride('X-HTTP-Method-Override')); // override with the X-HTTP-Method-Override header in the request


// routes ======================================================================
require('./config/routes')(app);
require('./config/db');
// listen (start app with node server.js) ======================================
app.listen(port);
console.log("App listening on port " + port);


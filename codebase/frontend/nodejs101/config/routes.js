var mongoose = require('mongoose');
var chatSchema = mongoose.Schema ({
  first_name: String,
  last_name:  String
  
});

testschema  = mongoose.model ('chatModel',chatSchema);

//var chatSchema  = require('../model/chat.js');
//var chatModel = require('../model/chat.js');
var path = require('path');
//var testschema = new chatSchema
//var testmodel = new chatModel
module.exports = function (app) {
    // api ---------------------------------------------------------------------
    // get all todos
//var express = require('express');
//var app = express();
//var bodyParser = require('body-parser');

// Create application/x-www-form-urlencoded parser
// var urlencodedParser = bodyParser.urlencoded({ extended: false })
//
 app.get('/index', function (req, res) {
    res.sendFile( path.resolve("public/index.html"));
    });



app.get('/process_get', function (req, res) {
    response = req.query.first_name;
    console.log(response);
    testschema.find({ 'first_name': response },'last_name', function (err,chatmodels) {
     if (err) return handleError(err);
      console.log(err);
      console.log(chatmodels);
         res.send(chatmodels);
          console.log(response);
    });
});


 app.post('/process_post', function (req, res) {
      // Prepare output in JSON format
       response = {
                first_name:req.body.first_name,
                      last_name:req.body.last_name
                         };
                            console.log(response);
                               res.end(JSON.stringify(response));
      testschema.create(response,function (err, chatmsg) {
            if (err)
                res.send(err);
            console.log (chatmsg + " mongo ");
        });
  });
}

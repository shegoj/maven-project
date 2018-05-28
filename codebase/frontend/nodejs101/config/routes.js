var mongoose = require('mongoose');
var chatSchema  = require('../model/chat');
var path = require('path');

module.exports = function (app) {

    // api ---------------------------------------------------------------------
    // get all todos
    app.get('/api/hello', function (req, res) {
        chatSchema.create({
            name: req.query.text,
            done: true
        }, function (err, chatmsg) {
            if (err)
                res.send(err);
            console.log (chatmsg + " mongo ");
        });

       console.log(req.query.text + " main ");
       res.sendFile(path.resolve('public/index.html'));
    });

    app.get ('/api/info', function (req, res ) {
      chatSchema.find( function (err, msg) {
            if (err)
                res.send(err);
            
            var msgCount = msg.length;
            for (var i = 0 ; i < msg.length ; ++i ) {
              console.log ("name : " + msg[i].name);
            }
            console.log (msg);
            res.json (msg);
        });
    });
}

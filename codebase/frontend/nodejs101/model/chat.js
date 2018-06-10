var mongoose = require('mongoose');

var chatSchema = mongoose.Schema ({
  first_name: String,
  last_name:  String
});

module.exports = mongoose.model ('chatModel',chatSchema);

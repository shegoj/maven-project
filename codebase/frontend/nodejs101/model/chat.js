var mongoose = require('mongoose');

var chatSchema = mongoose.Schema ({
  name: String
});

module.exports = mongoose.model ('chatModel',chatSchema);

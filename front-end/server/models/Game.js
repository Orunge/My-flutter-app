const mongoose = require('mongoose');

const GameSchema = new mongoose.Schema({
  type: String,         // "number", "shape"
  question: String,
  correct: String,
  options: [String]
});

module.exports = mongoose.model('Game', GameSchema);

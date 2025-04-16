const mongoose = require('mongoose');

const ProgressSchema = new mongoose.Schema({
  gameId: String,
  selectedAnswer: String,
  isCorrect: Boolean,
  createdAt: {
    type: Date,
    default: Date.now
  }
});

module.exports = mongoose.model('Progress', ProgressSchema);

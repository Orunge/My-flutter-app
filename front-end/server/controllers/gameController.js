const Game = require('../models/Game');
const Progress = require('../models/Progress');

exports.getGames = async (req, res) => {
  const games = await Game.find();
  res.json(games);
};

exports.addGame = async (req, res) => {
  const newGame = new Game(req.body);
  await newGame.save();
  res.json({ message: 'Game added successfully' });
};

exports.saveProgress = async (req, res) => {
  const { gameId, selectedAnswer, isCorrect } = req.body;
  const newProgress = new Progress({ gameId, selectedAnswer, isCorrect });
  await newProgress.save();
  res.json({ message: 'Progress saved' });
};

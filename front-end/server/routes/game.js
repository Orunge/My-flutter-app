const express = require('express');
const router = express.Router();
const Game = require('../models/Game');
const { getGames, addGame, saveProgress } = require('../controllers/gameController');

// 🧠 GET бүх тоглоом
router.get('/list', getGames);

// ➕ POST шинэ тоглоом
router.post('/add', addGame);

// 💾 POST хэрэглэгчийн хариу
router.post('/progress', saveProgress);

// 🎨 Color Sequence асуулт нэмэх
router.post('/add-color-sequence', async (req, res) => {
    const { type, question, correct, options } = req.body;
  
    // ⚠️ Заавал шалгах талбарууд
    if (
      !type ||
      typeof question !== 'string' ||
      !correct ||
      !Array.isArray(options)
    ) {
      return res.status(400).json({ message: '❌ Invalid input format' });
    }
  
    try {
      const newGame = new Game({
        type,
        question, // 🔥 аль хэдийн string хэлбэрээр өгөгдөж байгаа
        correct,
        options
      });
  
      await newGame.save();
      res.json({ message: '✅ Color-sequence нэмэгдлээ!' });
    } catch (error) {
      console.error('❌ Хадгалах үед алдаа:', error);
      res.status(500).json({ message: '❌ Server error', error });
    }
  });
  

module.exports = router;

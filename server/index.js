const express = require('express');
const mongoose = require('mongoose');
const cors = require('cors');
require('dotenv').config();

const app = express();
app.use(cors());
app.use(express.json());

mongoose.connect(process.env.MONGO_URI)
  .then(() => console.log('✅ MongoDB холбогдлоо'))
  .catch((err) => console.error('❌ Mongo алдаа:', err));

const gameRoutes = require('./routes/game');
app.use('/api/game', gameRoutes);

app.listen(5001, () => {
  console.log('🚀 Server running on http://127.0.0.1:5001');
});

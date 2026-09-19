const express = require('express');
const cors = require('cors');
const app = express();
app.use(cors());
app.get('/api/time', (_req, res) => res.json({ time: new Date().toUTCString() }));
app.listen(process.env.PORT || 3001, '0.0.0.0');

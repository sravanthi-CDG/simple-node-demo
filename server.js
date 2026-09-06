const express = require('express');
const os = require('os');
const path = require('path');

const app = express();
const PORT = process.env.PORT || 3000;

app.use(express.static(path.join(__dirname, 'public')));

// Health check endpoint - used by EC2/ALB and Elastic Beanstalk
app.get('/health', (req, res) => {
  res.status(200).json({ status: 'ok' });
});

// Simple API endpoint showing which host served the request
app.get('/api/info', (req, res) => {
  res.json({
    message: 'Hello from the Node.js demo app!',
    hostname: os.hostname(),
    platform: process.env.DEPLOY_TARGET || 'unknown',
    time: new Date().toISOString()
  });
});

app.listen(PORT, () => {
  console.log(`Server listening on port ${PORT}`);
});

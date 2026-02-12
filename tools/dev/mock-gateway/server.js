const express = require('express');
const app = express();

app.use(express.json());

app.post('/v1/chat/completions', (req, res) => {
  res.json({
    id: 'mock-1',
    object: 'chat.completion',
    created: Date.now(),
    model: 'mock-model',
    choices: [{
      index: 0,
      message: {
        role: 'assistant',
        content: 'This is a mock response for testing.'
      },
      finish_reason: 'stop'
    }]
  });
});

app.get('/health', (req, res) => {
  res.json({ status: 'ok' });
});

const PORT = process.env.PORT || 8000;
app.listen(PORT, () => {
  console.log(`Mock LLM Gateway running on port ${PORT}`);
});

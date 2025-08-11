import express from 'express';
import { StreamClient } from '@stream-io/node-sdk';

const app = express();
const port = 3000;

const apiKey = 'qhdc9y2f85v8';
const apiSecret = 'hajm5k8y3kad4gajg7d3spkb9cnuxykebu9gvgq6yxadzbfp4dbsuwej8v85m888';;

const serverClient = new StreamClient(apiKey, apiSecret);

app.get('/get-token', async (req, res) => {
  const userId = req.query.user_id;
  if (!userId) {
    return res.status(400).json({ error: 'Missing user_id' });
  }

  try {
    const token = serverClient.createToken(userId);
    res.json({ token });
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
});

app.listen(port, '0.0.0.0', () => {
  console.log(`Server running at http://0.0.0.0:${port}`);
});

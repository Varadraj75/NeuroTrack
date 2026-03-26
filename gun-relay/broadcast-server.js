const WebSocket = require('ws');
const wss = new WebSocket.Server({ port: 8765 });

let clients = new Set();

wss.on('connection', function(ws) {
  clients.add(ws);
  console.log('Client connected. Total:', clients.size);

  ws.on('message', function(message) {
    console.log('Broadcasting:', message.toString());
    clients.forEach(function(client) {
      if (client !== ws && client.readyState === WebSocket.OPEN) {
        client.send(message.toString());
      }
    });
  });

  ws.on('close', function() {
    clients.delete(ws);
    console.log('Client disconnected. Total:', clients.size);
  });
});

console.log('Broadcast server running on ws://localhost:8765');

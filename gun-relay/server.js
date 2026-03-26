const Gun = require('gun');
const http = require('http');

console.log('Starting GunDB relay server...');
const server = http.createServer((req, res) => {
    res.writeHead(200, {'Content-Type': 'text/plain'});
    res.end('GunDB Relay Server is running.\n');
});

const gun = Gun({
    web: server,
    radisk: true,
    file: 'radata'
});

gun.on('out', function(msg) {
  var to = this.to;
  to.next(msg);
});

server.listen(8765, () => {
    console.log('Server is listening at ws://127.0.0.1:8765/gun');
});

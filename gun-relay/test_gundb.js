const Gun = require('gun');
console.log('Starting script...');
const gun = Gun(['ws://127.0.0.1:8765/gun']);
gun.get('therapist_sessions_user123').on((data) => {
  console.log('RECEIVED IN NODE:', data);
});
setTimeout(() => {
  console.log('Sending test data...');
  gun.get('therapist_sessions_user123').put({"test_node": "hello"});
}, 2000);
setTimeout(() => {
  console.log('Done.');
  process.exit(0);
}, 5000);

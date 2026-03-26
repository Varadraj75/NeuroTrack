const Gun = require('gun');
const gun = Gun(['https://gun-manhattan.herokuapp.com/gun']);
gun.get('test_connection').put({hello: 'world'}, (ack) => {
  if(ack.err) console.log('Error:', ack.err);
  else {
      console.log('Connected to Manhattan!');
      process.exit(0);
  }
});
setTimeout(() => {
  console.log('Manhattan failed.');
  process.exit(1);
}, 3000);

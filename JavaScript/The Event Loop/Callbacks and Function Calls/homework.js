const readline = require('readline');

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

function askUserforBiscuits(callback) {
  reader.question('Would you like tea? ', (teaResponse) => {
    console.log(teaResponse);
    reader.question('Enter #2:', (biscuitResponse) => {
      console.log(`So you ${teaResponse} want tea, and you ${biscuitResponse} want biscuits.`)
      reader.close();
    });
  });
}

askUserforBiscuits();

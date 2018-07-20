const readline = require('readline');

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

function someTeaAndBiscuits() {
  reader.question("Would you like tea? ", function (teaRes) {
    console.log(`You replied ${teaRes}`);

    reader.question("Would you like biscuits? ", function (biscuitRes) {
      console.log(`You replied ${biscuitRes}`);

      const firstRes = (first === 'yes') ? 'do' : 'don\'t';
      const secondRes = (second === 'yes') ? 'do' : 'don\'t';

      console.log(`So you ${firstRes} want tea and you ${secondRes} want biscuits.`);
      reader.close();
    });
  });
}

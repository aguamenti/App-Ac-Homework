// PHASE 1

// why need ``
function madLib(verb, adj, noun) {
  return `We shall ${verb.toUpperCase()} the ${adj.toUpperCase()} ${noun.toUpperCase()}`
}

function isSubstring(searchString, subString) {
  return searchString.includes(subString);
}

// PHASE 2
function fizzBuzz(array) {
  var result = [];

  array.forEach( el => {
    if( el % 3 === 0 ^ el % 5 === 0 ) {
      result.push(el);
    }
  });

  return result;
}

function isPrime(number) {
  var result = true;
  for( let i = 2; i < number; i++ ) {
    if( number % i === 0 ) {
      result = false;
    }
  }
  return result
}

function sumOfNPrimes(n) {
  let counter = 0;
  let sum = 0;
  let int = 2;

  while( counter < n ) {
    if( isPrime(int) ) {
      sum += int;
      counter++;
    }
    int++;
  }
  return sum;
}

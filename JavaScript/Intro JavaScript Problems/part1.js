function madLib(verb, adj, noun) {
  return `We shall ${verb.toUpperCase()} the ${adj.toUpperCase()} ${noun.toUpperCase()}`;
}

console.log(madLib('make', 'best', 'guac'));

function isSubstring(searchString, subString) {
  return searchString.includes(subString)
}

console.log(isSubstring("time to program", "time"));
console.log(isSubstring("Jump for joy", "joys"));

function fizzBuzz(array) {
  let newArray = [];

  array.forEach((item, index) => {
    if (item % 3 == 0 && item % 5 == 0) {}
    else if (item % 3 == 0 || item % 5 == 0){
      newArray.push(item);
    }
  });

  return newArray;
}

console.log(fizzBuzz([2,3,4,5,6,7,8,15]));

function isPrime(number) {
  for (let i = 2; i < number; i++) {
    if (number % i == 0) {
      return false;
    }
  }
  return true;
}

console.log(isPrime(2))
console.log(isPrime(10))
console.log(isPrime(15485863))
console.log(isPrime(3548563));

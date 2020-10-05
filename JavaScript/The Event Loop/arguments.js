// Arguments can be accessed in an array-like object
function logArguments(arg1, arg2) {
  let result = [];

  for (let i = 0; i < arguments.length; i++) {
    result.push(arguments[i]);
  }

  return result
}

logArguments("boop", "candle", 3); // ["boop", "candle", 3]

// To use array methods, it must be sliced first
function thisWorks() {
  let args = Array.prototype.slice.call(arguments);
  args instanceof Array; //=> true
  args.forEach((arg) => console.log(arg)); // This works!
}

// With es6 you can use Array.from
function thisWorksToo() {
  let args = Array.from(arguments);
  args instanceof Array; //=> true
  args.forEach((arg) => console.log(arg)); // This works too!
}

/// ... operator
function restWay(firstArg, ...otherArgs) {
  console.log(`The first arg is ${firstArg}!`);

  console.log(`The other args are:`);

  otherArgs.forEach((arg) => {
    console.log(arg);
  });
}

function madLib(verb, pluralNoun1, pluralNoun2, place) {
  return `I like to ${verb} ${pluralNoun1} with ${pluralNoun2} by the ${place}.`;
}

const words = ["eat", "socks", "rabbits", "sea"];

madLib(...words); // equivalent to 'madLib(words[0], words[1], words[2], words[3])'

// Default values
function add(x, y = 17) {
  // y is 17 if not passed or passed as `undefined`
  return x + y;
}

add(3) === 20; //=> true
add(3, undefined) === 20; //=> true
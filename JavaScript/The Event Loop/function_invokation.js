// Other ways to call functions
// Apply
// Function.prototype.apply
const obj = {
  name: "Earl Watts"
};

// weird function; how is `this` supposed to be set if we don't call
// `greet` method style?
function greet(msg) {
  console.log(`${msg}: ${this.name}`);
}

greet.apply(obj, ["Hello"]);
// Apply binds 'this' to obj

// Function.prototype.call
// Very similar to apply
// Call is more convenient when you know what arguments you want to pass
// Apply is slightly slower because it needs to upack arguments
const obj = {
  name: "Earl Watts"
};

function greet(msg1, msg2) {
  console.log(`${msg1}: ${this.name}`);
  console.log(`${msg2}: ${this.name}`);
}

greet.call(obj, "Hello", "Goodbye");
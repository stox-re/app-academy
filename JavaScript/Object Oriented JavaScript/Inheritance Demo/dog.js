const Animal = require("./animal.js");

function Dog(name) {
  this.name = name;
}

Dog.prototype.woof = function() {
  console.log("Woof, I am " + this.name);
}

let Surrogate = function() {
  Surrogate.prototype = Animal.prototype;
};

Dog.prototype = new Surrogate();

module.exports = Dog;
function Animal(name) {
  this.name = name;
}

Animal.prototype.eat = function() {
  console.log("mmm, food...");
};

module.exports = Animal;
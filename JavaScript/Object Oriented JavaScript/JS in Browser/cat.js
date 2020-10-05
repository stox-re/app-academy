class Cat {
  constructor(name) {
    this.name = name;
  }
  meow() {
    console.log(`Meow, I am ${this.name}`);
  }
}

module.exports = Cat;
class Dog {
  constructor(name) {
    this.name = name;
  }
  woof() {
    console.log(`Woof, I am ${this.name}`);
  }
}

module.exports = Dog;
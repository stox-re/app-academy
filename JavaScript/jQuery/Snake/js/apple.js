const Coord = require('./coord.js');

class Apple {
  constructor(size) {
    this.coord = new Coord();
    this.position = this.randomPosition(size);
  }

  randomPosition(size) {
    let x = this.coord.getRandomInt(size);
    let y = this.coord.getRandomInt(size);
    return [x, y];
  }
}



module.exports = Apple;
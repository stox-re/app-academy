const Coord = require('./coord.js');

class Snake {
  constructor() {
    this.DIRECTIONS = ["N", "E", "S" ,"W"];
    this.direction = "S"
    this.segments = [[10,10]];
    this.coord = new Coord();
  }

  directionSwitch() {
    switch (this.direction) {
      case "E":
        return [0, 1];
      case "S":
        return [1, 0];
      case "W":
        return [0, -1];
      case "N":
        return [-1, 0];
    }
  }

  move() {
    let directionCoord = this.directionSwitch();
    this.segments.forEach((segment, index) => {
      this.segments[index] = this.coord.plus(segment, directionCoord);
    });
  }

  turn(direction) {
    this.direction = direction;
  }
}



module.exports = Snake;
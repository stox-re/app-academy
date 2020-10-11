const Coord = require('./coord.js');

class Snake {
  constructor() {
    this.DIRECTIONS = ["N", "E", "S" ,"W"];
    this.direction = "S"
    this.segments = [[10,10]];
    this.coord = new Coord();
    this.isGrowing = false;
    this.savedGrowingLocation;
    this.countGrowing = 0;
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

    this.segments.unshift(this.coord.plus(this.segments[0], directionCoord));
    if (this.isGrowing && this.countGrowing < 2) {
      this.segments.push(this.savedGrowingLocation);
      this.countGrowing += 1;
    } else {
      this.countGrowing = 0;
      this.isGrowing = false;
    }
    this.segments.pop();
  }

  grow() {
    this.isGrowing = true;
    this.savedGrowingLocation = this.segments[0];
  }

  turn(direction) {
    this.direction = direction;
  }
}



module.exports = Snake;
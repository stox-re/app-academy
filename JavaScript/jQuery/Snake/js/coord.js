class Coord {
  plus(coord, directionCoord) {
    let x = coord[0] + directionCoord[0];
    let y = coord[1] + directionCoord[1];
    return [x,y];
  }

  equals() {

  }

  isOpposite() {

  }
}

module.exports = Coord;
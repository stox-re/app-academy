const Snake = require('./snake.js');
const Apple = require('./apple.js');

class Board {
  constructor(size) {
    this.size = size;
    this.snake = new Snake();
    this.apple = new Apple(size);
    this.grid = [];
    this.build();
  }

  build() {
    for (let i = 0; i < this.size; i++) {
      this.grid.push([]);
    }
    for (let k = 0; k < this.size; k++) {
      for (let j = 0; j < this.size; j++) {
        this.grid[k].push([j,-k]);
      }
    }
  }

  newApple() {
    this.apple = new Apple(this.size);
  }

  snakeCollidesWithApple() {
    return (this.snake.segments[0][0] == this.apple.position[0] && this.snake.segments[0][1] == this.apple.position[1])
  }

  outOfBounds(position) {
    let x = position[0];
    let y = position[1];
    let wasOutOfBounds = false;
    if (x < 0 || x >= this.size) {
      wasOutOfBounds = true
    }
    if (y < 0 || y >= this.size) {
      wasOutOfBounds = true;
    }
    return wasOutOfBounds;
  }
}

module.exports = Board;
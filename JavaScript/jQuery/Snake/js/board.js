const Snake = require("./snake.js");

class Board {
  constructor(size) {
    this.size = size;
    this.snake = new Snake();
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
}

module.exports = Board;
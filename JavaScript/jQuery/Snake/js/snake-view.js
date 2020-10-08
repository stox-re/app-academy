const Board = require("./board");

class SnakeView {

  constructor(htmlElement) {
    const that = this;

    this.size = 20;
    this.el = htmlElement;
    this.keyListener(this);
    this.startFromBeginning();

    setInterval(function() {
      that.step();
    }, 200);
  }

  keyListener(bindThis) {
    const that = this;

    $(window).on('keydown', function(event) {
      if (event.keyCode == 38) {
        that.board.snake.turn('N');
      } else if (event.keyCode == 40) {
        that.board.snake.turn('S');
      } else if (event.keyCode == 39) {
        that.board.snake.turn('E');
      } else if (event.keyCode == 37) {
        that.board.snake.turn('W');
      }
    });
  }

  snakeFound(coordinates) {
    let found = false;

    this.board.snake.segments.forEach((segment, index) => {
      if (segment[0] == coordinates[0] && segment[1] == coordinates[1]) {
        found = true;
      }
    });

    return found;
  }

  appleFound(coordinates) {
    return (this.board.apple.position[0] == coordinates[0] && this.board.apple.position[1] == coordinates[1]);
  }

  renderBoard() {
    let boardBuilder = '';

    for (let i = 0; i < this.board.grid.length; i++) {
      boardBuilder += '<ul>'
      this.board.grid[i].forEach((element, index) => {
        if (this.snakeFound([i, index])) {
          boardBuilder += '<li class="tile snake"></li>';
        } else if (this.appleFound([i, index])){
          boardBuilder += '<li class="tile apple"></li>';
        } else {
          boardBuilder += '<li class="tile"></li>';
        }
      });
      boardBuilder += '</ul>';
    }

    this.el.innerHTML = boardBuilder;
  }

  step() {
    this.board.snake.move();
    if (this.board.outOfBounds(this.board.snake.segments[0])) {
      this.startFromBeginning();
    }
    if (this.board.snakeCollidesWithApple()) {
      this.board.newApple();
    }
    this.renderBoard();
  }

  startFromBeginning() {
    this.board = new Board(this.size);
    this.renderBoard();
  }
}

module.exports = SnakeView;
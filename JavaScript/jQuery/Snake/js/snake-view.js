const Board = require("./board");

class SnakeView {

  constructor(htmlElement) {
    const that = this;

    this.el = htmlElement;
    this.board = new Board(20);
    this.keyListener(this);
    this.renderBoard();

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

  renderBoard() {
    let boardBuilder = '';

    for (let i = 0; i < this.board.grid.length; i++) {
      boardBuilder += '<ul>'
      this.board.grid[i].forEach((element, index) => {
        if (this.snakeFound([i, index]) === true) {
          boardBuilder += '<li class="tile snake"></li>';
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
    this.renderBoard();
  }

}

module.exports = SnakeView;
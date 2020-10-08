const Snake = require('./snake.js');
const Coord = require('./coord.js');
const Board = require('./board.js');
const SnakeView = require('./snake-view.js');

window.Snake = Snake;
window.Coord = Coord;
window.Board = Board;

$(() => {
  window.SnakeView = new SnakeView(document.querySelector('#game'))
})
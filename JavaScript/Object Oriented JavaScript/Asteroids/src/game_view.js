const Game = require("./game.js");

function GameView () {
  this.game = new Game;
  let canvasSelect = document.querySelector('#game-canvas');
  this.ctx = canvasSelect.getContext('2d');
  this.GAME_SPEED = 100;
}

GameView.prototype.start = function() {
  window.setInterval(() => {
    this.game.step();
    this.game.draw(this.ctx);
  }, this.GAME_SPEED);
};

module.exports = GameView;
const Asteroid = require("./game.js");

function GameView () {
  this.game = new Game;
  let canvasSelect = document.querySelector('#game-canvas');
  this.ctx = canvasSelect.getContext('2d');
}

GameView.prototype.start = function() {
  window.setInterval(() => {
    this.game.moveObjects();
    this.game.draw(this.ctx);
  }, 1000);
};

module.exports = GameView;
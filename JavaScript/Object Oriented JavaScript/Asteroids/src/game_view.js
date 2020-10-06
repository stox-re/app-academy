const Game = require("./game.js");

function GameView () {
  this.game = new Game;
  let canvasSelect = document.querySelector('#game-canvas');
  this.ctx = canvasSelect.getContext('2d');
  this.GAME_SPEED = 100;
}

GameView.prototype.start = function() {
  this.bindKeyHandlers();
  window.setInterval(() => {
    this.game.step();
    this.game.draw(this.ctx);
  }, this.GAME_SPEED);
};

GameView.prototype.bindKeyHandlers = function() {
  key('left', () => {
    this.game.ship.power([-1,0])
  });
  key('right', () => {
    this.game.ship.power([1, 0])
  });
  key('up', () => {
    this.game.ship.power([0, -1])
  });
  key('down', () => {
    this.game.ship.power([0, 1])
  });
  key('space', () => {
    this.game.ship.fireBullet();
  });
};

module.exports = GameView;
const MovingObject = require("./moving_object.js");
const Utils = require("./utils.js");

function Ship(pos, game) {
  this.RADIUS = 10;
  this.COLOR = "blue";

  MovingObject.call(this, {
    pos: [pos[0], pos[1]],
    vel: [0,0],
    radius: this.RADIUS,
    color: this.COLOR,
    game: game
  });
}

Utils.inherits(Ship, MovingObject);

Ship.prototype.relocate = function() {
  this.position = this.game.randomPosition();
  this.velocity = [0, 0];
};

module.exports = Ship;
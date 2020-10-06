const MovingObject = require("./moving_object.js");
const Utils = require("./utils.js");

function Bullet(pos, velocity, game) {
  this.RADIUS = 2;
  this.COLOR = "green";

  MovingObject.call(this, {
    pos: [pos[0], pos[1]],
    vel: [velocity[0]+velocity[0], velocity[1]+velocity[1]],
    radius: this.RADIUS,
    color: this.COLOR,
    game: game,
    isWrappable: false
  });
}

Utils.inherits(Bullet, MovingObject);

module.exports = Bullet;
const MovingObject = require("./moving_object.js");
const Bullet = require("./bullet.js");
const Utils = require("./utils.js");

function Ship(pos, game) {
  this.RADIUS = 10;
  this.COLOR = "blue";

  MovingObject.call(this, {
    pos: [pos[0], pos[1]],
    vel: [0,0],
    radius: this.RADIUS,
    color: this.COLOR,
    game: game,
    isWrappable: true
  });
}

Utils.inherits(Ship, MovingObject);

Ship.prototype.relocate = function() {
  this.position = this.game.randomPosition();
  this.velocity = [0, 0];
};

Ship.prototype.power = function(impulse) {
  console.log("INCREASING POWER " + impulse );
  this.velocity[0] += impulse[0];
  this.velocity[1] += impulse[1];
};

Ship.prototype.fireBullet = function() {
  console.log("Firiing bullet");
  console.log("This velocity: " + this.velocity);
  let bullet = new Bullet(this.position, this.velocity, this.game);
  this.game.bullets.push(bullet);
  console.log(this.game.bullets);
};

module.exports = Ship;
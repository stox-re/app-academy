const Asteroid = require("./asteroid.js");
const Utils = require("./utils.js");

function Game() {
  this.DIM_X = 500;
  this.DIM_Y = 500;
  this.NUM_ASTEROIDS = 10;
  this.asteroids = [];
  this.addAsteroids();
}

Game.prototype.step = function() {

};

Game.prototype.addAsteroids = function() {
  for (let i = 0; i < this.NUM_ASTEROIDS; i++) {
    this.asteroids.push(new Asteroid(this.randomPosition()));
  }
};

Game.prototype.randomPosition = function() {
  return [Utils.randomInt(this.DIM_X), Utils.randomInt(this.DIM_Y)];
};

Game.prototype.moveObjects = function() {
  this.asteroids.forEach((asteroid) => {
    asteroid.move();
  });
};

Game.prototype.checkCollisions = function() {

};

Game.prototype.draw = function(ctx) {
  ctx.clearRect(0, 0, this.DIM_X, this.DIM_Y);
  this.asteroids.forEach((asteroid, index) => {
    console.log(`Drawing asteroid: ${index}`)
    asteroid.draw(ctx);
  });
};

module.exports = Game;
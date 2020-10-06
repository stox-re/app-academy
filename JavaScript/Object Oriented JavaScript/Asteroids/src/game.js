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
    this.asteroids.push(new Asteroid(this.randomPosition(), this));
  }
};

Game.prototype.wrap = function(pos) {
  let x = pos[0], y = pos[1];
  let newX = pos[0];
  let newY = pos[1];

  if (x <= 0) {
    newX = this.DIM_X;
  } else if (x >= this.DIM_X) {
    newX = 0;
  }
  if (y <= 0) {
    y = this.DIM_Y;
  } else if (y >= this.DIM_Y) {
    newY = 0;
  }

  return [newX, newY];
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
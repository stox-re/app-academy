const Asteroid = require("./asteroid.js");
const Ship = require("./ship.js");
const Utils = require("./utils.js");

function Game() {
  this.DIM_X = 500;
  this.DIM_Y = 500;
  this.NUM_ASTEROIDS = 3;
  this.asteroids = [];
  this.addAsteroids();
  this.ship = new Ship([250,250], this);
  this.bullets = [];
}

Game.prototype.step = function() {
  this.moveObjects();
  this.checkCollisions();
};

Game.prototype.remove = function(object) {
  this.asteroids.forEach((asteroidFound, index) => {
    if (object == asteroidFound) {
      this.asteroids.splice(index, 1);
    }
  });
  this.bullets.forEach((bulletFound, bulletIndex) => {
    if (object == bulletFound) {
      this.bullets.splice(bulletIndex, 1)
    }
  });
};

Game.prototype.addAsteroids = function() {
  for (let i = 0; i < this.NUM_ASTEROIDS; i++) {
    this.asteroids.push(new Asteroid(this.randomPosition(), this));
  }
};

Game.prototype.wrap = function(pos) {
  let x = pos[0];
  let y = pos[1];
  let newX = pos[0];
  let newY = pos[1];

  if (x <= 0) {
    newX = this.DIM_X;
  } else if (x >= this.DIM_X) {
    newX = 0;
  }
  if (y <= 0) {
    newY = this.DIM_Y;
  } else if (y >= this.DIM_Y) {
    newY = 0;
  }

  return [newX, newY];
};

Game.prototype.isOutOfBounds = function(pos) {
  if (pos[0] >= this.DIM_X || pos[0] <= 0) {
    return true;
  }
  if (pos[1] >= this.DIM_Y || pos[1] <= 0) {
    return true;
  }
  return false;
};

Game.prototype.randomPosition = function() {
  return [Utils.randomInt(this.DIM_X), Utils.randomInt(this.DIM_Y)];
};

Game.prototype.moveObjects = function() {
  this.asteroids.forEach((asteroid) => {
    asteroid.move();
  });
  this.bullets.forEach((bullet) => {
    bullet.move();
  });
  this.ship.move();
};

Game.prototype.checkCollisions = function() {
  this.asteroids.forEach((asteroid, index) => {
    this.bullets.forEach((bullet, bulletIndex) => {
      if (asteroid.isCollidedWith(bullet)) {
        this.remove(asteroid);
        this.remove(bullet);
      }
    });
  });
  this.asteroids.forEach((asteroid) => {
    asteroid.collideWith(this.ship);
  });
};

Game.prototype.draw = function(ctx) {
  ctx.clearRect(0, 0, this.DIM_X, this.DIM_Y);
  this.ship.draw(ctx);
  this.bullets.forEach((bullet) => {
    bullet.draw(ctx);
  });
  this.asteroids.forEach((asteroid, index) => {
    asteroid.draw(ctx);
  });

};

module.exports = Game;
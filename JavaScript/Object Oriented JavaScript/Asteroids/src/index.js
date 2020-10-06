const Asteroid = require('./asteroid.js');
const Bullet = require('./bullet.js');
const GameView = require('./game_view.js');
const MovingObject = require('./moving_object.js');
const Ship = require('./ship.js');
const Utils = require('./utils.js');

window.MovingObject = MovingObject;

window.addEventListener('DOMContentLoaded', (event) => {
  console.log("Webpack is working");
  const gameCanvas = document.querySelector("#game-canvas");
  const ctx = gameCanvas.getContext('2d');

  const mo = new MovingObject({
    pos: [30, 30],
    vel: [10, 10],
    radius: 5,
    color: "#00FF00"
  });
  mo.draw(ctx);

});

const Asteroid = require('./asteroid.js');
const Bullet = require('./bullet.js');
const Game = require('./game.js');
const GameView = require('./game_view.js');
const MovingObject = require('./moving_object.js');
const Ship = require('./ship.js');
const Utils = require('./utils.js');

//window.MovingObject = MovingObject;
//window.Asteroid = Asteroid;
//window.Bullet = Bullet;
//window.GameView = GameView;
//window.Ship = Ship;
//window.Game = Game;



window.Utils = Utils;

window.addEventListener('DOMContentLoaded', (event) => {
  console.log("Loaded Asteroids Gamge");
  const gameView = new GameView();
  gameView.start();
});

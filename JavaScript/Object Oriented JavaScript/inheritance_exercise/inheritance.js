Function.prototype.inherits = function(toInherit) {
  function Surrogate() {}
  Surrogate.prototype = toInherit.prototype;
  this.prototype = new Surrogate();
  this.prototype.constructor = this;
}

Function.prototype.inheritsCreate = function (toInherit) {
  this.prototype = Object.create(toInherit.prototype);
  this.prototype.constructor = this;
};

/*
function MovingObject() { }

function Ship() { }
Ship.inherits(MovingObject);

function Asteroid() { }
Asteroid.inherits(MovingObject);
*/

class MovingObject {}
class Ship extends MovingObject {}
class Asteroid extends MovingObject {}
function MovingObject (incoming) {
  this.position = incoming.pos;
  this.velocity = incoming.vel;
  this.radius = incoming.radius;
  this.color = incoming.color;
}

MovingObject.prototype.move = function() {
  this.position[0] += this.velocity[0];
  this.position[1] += this.velocity[1];
};

MovingObject.prototype.draw = function(ctx) {
  console.log(`Moving object drawing with: ${ctx}`)
  console.log(this.position);
  ctx.beginPath();
  ctx.arc(this.position[0], this.position[1], this.radius, 0, 2 * Math.PI);
  ctx.fillStyle = this.color;
  ctx.fill();
};

MovingObject.prototype.isCollidedWith = function(otherMovingObject) {

};

module.exports = MovingObject;
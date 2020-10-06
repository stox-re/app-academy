const MovingObject = require("./moving_object.js");
const Utils = require("./utils.js");

function Ship() {

}

Utils.inherits(Ship, MovingObject);

module.exports = Ship;
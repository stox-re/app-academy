let Dog = require('./dog.js')
let Cat = require('./cat.js')

window.Dog = Dog;
window.Cat = Cat;

/*

webpack ./root.js - o bundle.js --mode = development

*/
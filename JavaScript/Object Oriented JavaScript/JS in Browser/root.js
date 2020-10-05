const Cat = require('./cat.js');
const Dog = require('./dog.js');

let c = new Cat("Maria");
let d = new Dog('India');

c.meow();
d.woof();

/*

  webpack ./root.js -o bundle.js

*/


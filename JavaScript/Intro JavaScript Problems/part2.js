const titleCallback = (array) => {
  array.forEach((name)=>{
    console.log(name);
  });
};

function titleize(arrayOfNames, callback) {
  newArrayOfNames = arrayOfNames.map((name)=>{
    return `Mx. ${name.charAt(0).toUpperCase() + name.slice(1)} Jingleheimer Schmidt`
  });
  console.log(newArrayOfNames);
  callback(newArrayOfNames);
}

titleize(["Mary", "Brian", "Leo"], titleCallback);

function Elephant(name, height, tricks) {
  this.name = name;
  this.height = height;
  this.tricks = tricks;
}

Elephant.prototype.trumpet = function() {
  console.log(`${this.name} the elephant goes phrRRRRRR!!!!`);
}
Elephant.prototype.grow = function() {
  this.height += 12;
}
Elephant.prototype.addTrick = function(trick) {
  this.tricks.push(trick);
}
Elephant.prototype.play = function() {
  return `${this.name} is ${this.tricks[Math.floor(Math.random() * Math.floor(this.tricks.length))]}`;
}

const timothy = new Elephant("Tim", 100, ["painting a picture", "throwing a ball", "jumping up and down"])
timothy.grow();
timothy.trumpet();
timothy.addTrick("sings a song");
console.log(timothy.play());

let ellie = new Elephant("Ellie", 185, ["giving human friends a ride", "playing hide and seek"]);
let charlie = new Elephant("Charlie", 200, ["painting pictures", "spraying water for a slip and slide"]);
let kate = new Elephant("Kate", 234, ["writing letters", "stealing peanuts"]);
let micah = new Elephant("Micah", 143, ["trotting", "playing tic tac toe", "doing elephant ballet"]);

let herd = [ellie, charlie, kate, micah];

Elephant.prototype.paradeHelper = function(elephant) {
  console.log(`${elephant.name} is trotting by`);
}

herd.forEach((elephant, index) => {
  elephant.paradeHelper(elephant)
});

function dinerBreakfast() {
  let order = "I'd like cheesy scrambled eggs please.";
  console.log(order);

  return function (food) {
    order = `${order.slice(0, order.length - 8)} and ${food} please.`;
    console.log(order);
  };
};

let bFastOrder = dinerBreakfast();
bFastOrder("chocolate chip pancakes");
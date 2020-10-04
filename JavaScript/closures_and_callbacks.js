"use strict";

function soundMaker(sound, times) {

  // closure captures the free variable sound
  function makeSound() {
    console.log(`${sound}`);
  }

  for (let i = 0; i < times; i ++) {
    makeSound();
  }
}

soundMaker("woof", 5);

/* global */
let callback = function() {
  console.log("It has been 5 seconds");
}
let timeToWait = 5000;

global.setTimeout(callback, timeToWait);

// More likely to see
global.setTimeout(function(){
  console.log("It has been 5 seconds");
}, 5000)

// ES6
global.setTimeout(() => {
  console.log("It has been 5 seconds")
}, 5000)
// ^^ preferred syntax
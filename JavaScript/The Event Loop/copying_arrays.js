// bad
const len = items.length;
const itemsCopy = [];
let i;

for (i = 0; i < len; i += 1) {
  itemsCopy[i] = items[i];
}

// good
const itemsCopy = [...items];


const foo = document.querySelectorAll('.foo');
// good
const nodes = Array.from(foo);

// best
const nodes = [...foo];
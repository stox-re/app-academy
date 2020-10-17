/* Actions are the only way for view components to trigger changes to the store */

// actions/fruit_actions.js
const addFruit = fruit => ({
  type: "ADD_FRUIT",
  fruit
});


store.dispatch(addFruit("Apple"));
store.dispatch(addFruit("Strawberry"));
store.dispatch(addFruit("Lychee"));
store.getState(); // [ 'orange', 'apple', 'strawberry', 'lychee' ]

// actions/fruit_actions.js
export const ADD_FRUIT = "ADD_FRUIT";
export const ADD_FRUITS = "ADD_FRUITS";
export const SELL_FRUIT = "SELL_FRUIT";

export const addFruit = fruit => ({
  type: ADD_FRUIT,
  fruit
});

export const addFruits = fruits => ({
  type: ADD_FRUITS,
  fruits
});

export const sellFruit = fruit => ({
  type: SELL_FRUIT,
  fruit
});
/*
  The redux library provides us with a createStore() method,
  which takes up to three arguments and returns a Redux store.
*/

createStore(reducer, [preloadedState], [enhancer]);

// store.js
import { createStore } from `redux`;
import reducer from './reducer.js';

const store = createStore(reducer);

// Methods
getState()
dispatch(action)
subscribe(callback)

// Store updates can only be triggered by dispatching actions
store.dispatch(action);

/*
  An action in Redux is just a plain object with:
  a type key indicating the action being performed, and
  optional payload keys containing any new information.
*/
// actions.js
const addOrange = {
  type: "ADD_FRUIT",
  fruit: "orange"
};


// Here is a reducer for ADD_FRUIT

// reducer.js
const reducer = (state = [], action) => {
  switch (action.type) {
    case "ADD_FRUIT":
      return [...state, action.fruit];
    default:
      return state;
  }
};

export default reducer;

// store.js
import { createStore } from "redux";
import reducer from "./reducer.js";
import { addOrange } from "./actions.js";

const store = createStore(reducer);

store.getState(); // []
store.dispatch(addOrange);
store.getState(); // ['orange']

// With a callback for subscribing
const display = () => {
  console.log(store.getState());
};

const unsubscribeDisplay = store.subscribe(display);
store.dispatch(addOrange); // ['orange', 'orange']

// ...later (when we are done displaying)
unsubscribeDisplay(); // display will no longer be invoked after store.dispatch()

// Connecting component to the store
// components/fruit_stand.jsx
import React from "react";

class FruitStand extends React.Component {
  constructor(props) {
    super(props);

    /* Note: Subscribing `forceUpdate()` is not a recommended pattern and used
    for illustration purposes only. See the `NB` below. */
    this.forceUpdate = this.forceUpdate.bind(this);
    this.unsubscribe = this.props.store.subscribe(this.forceUpdate);
  }

  render() {
    return (
      <ul>
        {this.props.store.getState().map((fruit, idx) => (
          <li key={idx}>{fruit}</li>
        ))}
      </ul>
    );
  }

  // let's make sure that when we are done with our component
  // we unsubscribe any callbacks we registered to the store
  componentWillUnmount() {
    this.unsubscribe();
  }
}

export default FruitStand;
// Note the use of Object.freeze(). Even though fruitReducer doesn't mutate the state,
// Object.freeze() will ensure that state can't be accidentally mutated.
// Get in the habit of using Object.freeze at the top of every reducer you write!


// fruit_reducer.js
const fruitReducer = (state = [], action) => {
  switch (action.type) {
    case "ADD_FRUIT":
      return [...state, action.fruit];
    case "ADD_FRUITS":
      return [...state, ...action.fruits];
    case "SELL_FRUIT":
      const idx = state.indexOf(action.fruit);
      if (idx !== -1) {
        // remove first instance of action.fruit
        return [...state.slice(0, idx), ...state.slice(idx + 1)];
      } else {
        return state; // if action.fruit is not in state, return previous state
      }
    case "SELL_OUT":
      return [];
    default:
      return state;
  }
};

// good reducer

const goodReducer = (state = { count: 0 }, action) => {
  Object.freeze(state);
  switch (action.type) {
    case "INCREMENT_COUNTER":
      let nextState = Object.assign({}, state);
      nextState.count++;
      return nextState;
    default:
      return state;
  }
};

// State tree of new app
let stateObj = {
  farmers: {
    "1": {
      id: 1,
        name: "Ol' McDonald",
          paid: false,
		},
    "2": {
      id: 2,
        name: "Rabbit",
          paid: true
    }
  },
  fruits: [
    "orange",
    "orange",
    "apple",
    "lychee",
    "grapefruit"
  ]
};

// reducers/farmers_reducer.js
const farmersReducer = (state = {}, action) => {
  Object.freeze(state);
  let nextState = Object.assign({}, state);
  switch (action.type) {
    case "HIRE_FARMER":
      // shallow dup previous state
      const farmer = {
        // create new farmer object
        id: action.id,
        name: action.name,
        paid: false
      };
      nextState[action.id] = farmer; // add new farmer to state
      return nextState;
    case "PAY_FARMER":
      let farmer = nextState[action.id];
      farmer.paid = !farmer.paid;
      return nextState;
    default:
      return state;
  }
};

export default farmersReducer;

// Create store only takes a single reducer so we need to Combine them

// reducers/root_reducer.js
import { combineReducers } from "redux";
import fruitsReducer from "./fruits_reducer";
import farmersReducer from "./farmers_reducer";
const rootReducer = combineReducers({
  fruits: fruitsReducer,
  farmers: farmersReducer
});
export default rootReducer;

// store/store.js
import { createStore } from "redux";
import rootReducer from "./reducers/root_reducer.js";
const store = createStore(rootReducer);
// initial state
store.getState(); // { fruits: [], farmers: {} }

// Delegating to reducers
// reducers/farmers_reducer.js
const farmerReducer = (state, action) => {
  // state is a farmer object
  Object.freeze(state);
  switch (action.type) {
    case "HIRE_FARMER":
      return {
        id: action.id,
        name: action.name,
        paid: false
      };
    case "PAY_FARMER":
      return Object.assign({}, state, {
        paid: !state.paid
      });
    default:
      return state;
  }
};

const farmersReducer = (state = {}, action) => {
  Object.freeze(state);
  let nextState = Object.assign({}, state);
  switch (action.type) {
    case "HIRE_FARMER":
      nextState[action.id] = farmerReducer(undefined, action);
      return nextState;
    case "PAY_FARMER":
      nextState[action.id] = farmerReducer(nextState[action.id], action);
      return nextState;
    default:
      return state;
  }
};

export default farmersReducer;
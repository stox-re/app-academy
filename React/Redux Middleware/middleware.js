// store/store.js

import { createStore, applyMiddleware } from 'redux';
import rootReducer from 'reducers';
import logger from 'redux-logger';

let configureStore = (preloadedState = {}) => (
  createStore(
    rootReducer,
    preloadedState,
    applyMiddleware(logger)
  )
);

export default configureStore;

/*
  Any actions dispatched to the store pass through our logger middleware,
  which prints the store's state before and after the action is processed.
*/

/* To make your own middleware it must follow this syntax */
const middleware = store => next => action => {
  // side effects, if any
  return next(action);
};

/* Custom logger */
const logger = store => next => action => {

  console.log('Action received:', action);
  console.log('State pre-dispatch:', store.getState());

  let result = next(action);

  console.log('State post-dispatch:', store.getState());

  return result;
};

// To install redux-logger
// npm install redux-logger--save

// Logger must be the last one
// store/store.js
import { createStore, applyMiddleware } from 'redux';
import rootReducer from 'reducers';
import thunk from 'redux-thunk';
import logger from 'redux-logger';

let configureStore = (preloadedState = {}) => (
  createStore(
    rootReducer,
    preloadedState,
    applyMiddleware(thunk, logger)
  )
);

export default configureStore;

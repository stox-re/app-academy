// npm install redux-devtools-extension

// frontend/store/store.js

import { createStore, applyMiddleware } from 'redux';
import thunk from 'redux-thunk';
import logger from 'redux-logger';

// +
import { composeWithDevTools } from 'redux-devtools-extension';
// +

import rootReducer from '../reducers/root_reducer';

const configureStore = (preloadedState = {}) => (
  createStore(
    rootReducer,
    preloadedState,
    // +
    composeWithDevTools(applyMiddleware(thunk, logger))
    // +
    - applyMiddleware(thunk, logger)
  )
);

export default configureStore;

//Setting up react and redux
/*
npm install--save the following packages:

webpack
webpack-cli
react
react-dom
react-router-dom
redux
react-redux
redux-logger
@babel/core
@babel/preset-env
@babel/preset-react
babel-loader

*/

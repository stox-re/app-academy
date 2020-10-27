import { createStore, applyMiddleware } from 'redux';
import logger from 'redux-logger';
import rootReducer from '../reducers/root_reducer';

let middlewares = [logger];

const configureStore = () => {
  return createStore(rootReducer, {}, applyMiddleware(...middlewares));
};

export default configureStore;
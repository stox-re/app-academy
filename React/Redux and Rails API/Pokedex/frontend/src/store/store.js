import { createStore, applyMiddleware } from 'redux';
import logger from 'redux-logger';
import rootReducer from '../reducers/root_reducer';
import thunk from '../middleware/thunk';

let middlewares = [logger, thunk];

const configureStore = () => {
  return createStore(rootReducer, {}, applyMiddleware(...middlewares));
};

export default configureStore;
import { createStore, applyMiddleware } from 'redux';
import rootReducer from '../reducers/root_reducer';
import thunk from '../middleware/thunk';
import logging from '../middleware/logging';


let middlewares = [logging, thunk];

const configureStore = () => {
  return createStore(rootReducer, {}, applyMiddleware(...middlewares));
};

export default configureStore;
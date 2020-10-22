import { createStore, applyMiddleware } from 'redux';
import rootReducer from '../reducers/root_reducer';

const addLoggingToDispatch = (inputStore) => {
  return (next) => {
    return (action) => {
      console.log(inputStore.getState());
      console.log(action);
      next(action);
      console.log(inputStore.getState());
    };
  };
};

const configureStore = () => {
  return createStore(rootReducer, {}, applyMiddleware(addLoggingToDispatch));
};

export default configureStore;
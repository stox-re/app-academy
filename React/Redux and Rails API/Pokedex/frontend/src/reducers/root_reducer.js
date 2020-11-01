import { combineReducers } from 'redux';
import entitiesReducer from './entities_reducer';
import uiReducer from './ui_reducer';
import loadingReducer from './loading_reducer';
import errorsReducer from './errors_reducer';

const rootReducer = combineReducers({
  entities: entitiesReducer,
  ui: uiReducer,
  loading: loadingReducer,
  errors: errorsReducer
});

export default rootReducer
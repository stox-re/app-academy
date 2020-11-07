import * as SessionActions from '../actions/session_actions';

const _nullErrors = [];

const sessionErrorsReducer = (state = _nullErrors, action) => {

  switch (action.type) {
    case SessionActions.RECEIVE_SESSION_ERRORS:
      return action.errors

    case SessionActions.RECEIVE_CURRENT_USER:
      return _nullErrors;

    default:
      return state;
  };
};

export default sessionErrorsReducer;
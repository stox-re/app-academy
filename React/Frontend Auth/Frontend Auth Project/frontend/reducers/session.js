import * as SessionActions from '../actions/sessions';

const _nullSession = {
  currentUser: null
};

const sessionReducer = (state = _nullSession, action) => {
  Object.freeze(state);

  switch(action.type) {
    case SessionActions.RECEIVE_CURRENT_USER:
      return Object.assign({}, { currentUser: action.user })

    case SessionActions.LOGOUT_CURRENT_USER:
      return _nullSession;

    default:
      return state;
  };
};

export default sessionReducer;
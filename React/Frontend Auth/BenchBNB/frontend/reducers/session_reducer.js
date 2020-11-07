import * as SessionActions from '../actions/session_actions';

const _nullSession = {
  id: null
};

const sessionReducer = (state = _nullSession, action) => {
  Object.freeze(state);

  switch (action.type) {
    case SessionActions.RECEIVE_CURRENT_USER:
      return Object.assign({}, { id: action.user.id })

    case SessionActions.LOGOUT_CURRENT_USER:
      return _nullSession;

    default:
      return state;
  };
};

export default sessionReducer;
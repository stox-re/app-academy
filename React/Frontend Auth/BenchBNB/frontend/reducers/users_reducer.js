import * as SessionActions from '../actions/session_actions';

const _nullUsers = {};

const usersReducer = (state = _nullUsers, action) => {
  Object.freeze(state);

  switch (action.type) {
    case SessionActions.RECEIVE_CURRENT_USER:
      console.log("Receiving current user");
      console.log(action.user);
      return Object.assign({}, state, { [action.user.id]: action.user })

    default:
      return state;
  };
};

export default usersReducer;
import * as SessionUtils from '../utils/session';

export const RECEIVE_CURRENT_USER = "RECEIVE_CURRENT_USER";
export const LOGOUT_CURRENT_USER = "LOGOUT_CURRENT_USER";

const receiveCurrentUser = (user) => {
  return {
    type: RECEIVE_CURRENT_USER,
    user: user
  };
};

const logoutCurrentUser = () => {
  return {
    type: LOGOUT_CURRENT_USER
  }
};

export const createNewUser = formUser => dispatch => SessionUtils.postUser(formUser)
  .then((user) => {
    dispatch(receiveCurrentUser(user));
  });

export const login = formUser => dispatch => SessionUtils.postSession(formUser)
  .then((user) => {
    dispatch(receiveCurrentUser(user));
  });

export const logout = () => dispatch => SessionUtils.deleteSession()
  .then(() => {
    dispatch(logoutCurrentUser());
  });